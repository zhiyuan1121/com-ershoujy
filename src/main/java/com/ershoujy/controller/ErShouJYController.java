package com.ershoujy.controller;

import com.ershoujy.Uiit.Datatime;
import com.ershoujy.pojo.*;
import com.ershoujy.service.*;
import com.ershoujy.service.impl.UserServiceImpl;
import org.apache.ibatis.annotations.Insert;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.SoundbankResource;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

//@SessionAttributes(value = {"userid","uuid"},types = {Insert.class,String.class})
@RestController
@RequestMapping
public class ErShouJYController {
    @Autowired
    private IUserService userservice;
    @Autowired
    private Datatime uiit;
    @Autowired
    private ISPService spservice;
    @Autowired
    private IGWCService gwcservice;
    @Autowired
    private IDDService ddservice;
    @Autowired
    private ISHDZService shdzService;
    @Autowired
    private IUUidService uuidservice;
    @RequestMapping("anon/login")
    public ModelAndView login(Integer loginUsername,String loginPassword,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("login");
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(""+loginUsername, uiit.getMd5(loginPassword));
        UserB user = userservice.login(loginUsername);
        try {
            subject.login(token);
            mv.setViewName("redirect:/ym/authc/zhuye");
            String uuid=UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
            request.getSession().setAttribute("userid",loginUsername);
            request.getSession().setAttribute("uname",user.getUname());
            request.getSession().setAttribute("uuid",uuid);
//            mv.addObject("userid",uid);
//            mv.addObject("uuid",uuid);
//            System.out.println(uid);
//            System.out.println(uuid);
            uuidservice.setuuid(loginUsername,uuid);
            //登录成功
        }catch (UnknownAccountException e){
            mv.addObject("ts","用户名不存在");
            //用户名不存在
        }catch (IncorrectCredentialsException e){
            mv.addObject("ts","密码错误");
            //密码错误
        }
        return mv;
    }

    @RequestMapping("anon/zhuche")
    public ModelAndView zhuhce(String name,String paw){
        UserB user = new UserB();
        user.setUname(name);
        user.setUpaw(uiit.getMd5(paw));
        ModelAndView mv = new ModelAndView();
        if(userservice.zc(user)==1) {
            mv.setViewName("login");
            mv.addObject("zcts", user.getUserid());
            uuidservice.add(user.getUserid());
        }else{
            mv.setViewName("zhuche");
            mv.addObject("zcts","未知原因注册失败请重新注册");
        }
        return mv;
    }

    @RequestMapping("authc/spadd")
    public ModelAndView spdd(HttpServletRequest request, MultipartFile img, String spname, String spxq, String spjg){
        ModelAndView mv = new ModelAndView();
        String filename="";
        try {
        // 先获取到要上传的文件目录
        String path = request.getSession().getServletContext().getRealPath("/img");
        // 创建File对象，一会向该路径下上传文件
            // System.out.println(path);
        File file = new File(path);
        // 判断路径是否存在，如果不存在，创建该路径

        if(!file.exists()) {
            file.mkdirs();
        }
        // 获取到上传文件的名称
        filename = img.getOriginalFilename();
        //获取二进制流

            byte[] filebyte = img.getBytes();
            String uuid = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
            // 把文件的名称唯一化
            filename = uuid;
            // 上传文件
            img.transferTo(new File(file, filename));

        SPB spb = new SPB();
        spb.setFbuid((Integer) request.getSession().getAttribute("userid"));
        spb.setSpname(spname);
        spb.setSpjpg(filename);
        spb.setSpjg(new BigDecimal(spjg));
        spb.setSpxq(spxq);
        spservice.Addsp(spb);
        mv.setViewName("forward:/authc/wdwp");
        }catch (Exception e){
            e.printStackTrace();
            mv.setViewName("forward:/ym/authc/spadd");
            mv.addObject("cwts","未知错误请重试");
        }
        return mv;
    }

    @RequestMapping("authc/wdwp")
    public ModelAndView wdesj(HttpServletRequest request,Integer yema){
        if(yema==null){
            yema=1;
        }
        int count=10;
        int uid=(Integer) request.getSession().getAttribute("userid");
        List<SPB> spbs = spservice.finbyuid(uid, yema, count);
        ModelAndView mv = new ModelAndView();
        int ymax=spservice.yemabyuid(uid,count);
        mv.setViewName("wodesj");
        mv.addObject("ymax",ymax);
        mv.addObject("yema",yema);
        mv.addObject("spbs",spbs);
        return mv;
    }

    @RequestMapping("authc/spsj/{spid}")
    public int spsj(@PathVariable("spid") int spid,HttpServletRequest request){
        System.out.println(spid);
        return spservice.sjsp(spid,(Integer) request.getSession().getAttribute("userid"));
    }
    @RequestMapping("authc/spxj/{spid}")
    public int spxj(@PathVariable("spid") int spid,HttpServletRequest request){
        return spservice.xjsp(spid,(Integer) request.getSession().getAttribute("userid"));
    }

    @RequestMapping("/anon/spxq/{spid}")
    public ModelAndView spxq(@PathVariable("spid") int spid){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("spxq");
        SPB sp = spservice.finbyspid(spid);
        mv.addObject("sp",sp);
        return mv;
    }

    @RequestMapping("anon/llsp")
    public ModelAndView llsp(String gjz,Integer yema){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("spall");
        if(gjz==null){
            gjz="";
        }
        if(yema==null){
            yema=1;
        }
        int count = 10;
        int ymax=spservice.yemaMax(gjz,count);
        List<SPB> sps = spservice.finall(gjz, yema, count);
        mv.addObject("ymax",ymax);
        mv.addObject("gjz",gjz);
        mv.addObject("spbs",sps);
        mv.addObject("yema",yema);
        return mv;
    }

    @RequestMapping("/")
    public ModelAndView llsp1(String gjz,Integer yema){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("spall");
        if(gjz==null){
            gjz="";
        }
        if(yema==null){
            yema=1;
        }
        int count = 10;
        int ymax=spservice.yemaMax(gjz,count);
        List<SPB> sps = spservice.finall(gjz, yema, count);
        mv.addObject("ymax",ymax);
        mv.addObject("gjz",gjz);
        mv.addObject("spbs",sps);
        mv.addObject("yema",yema);
        return mv;
    }

    @RequestMapping("authc/jrgwc/{spid}")
    public String jrgwc(@PathVariable("spid") int spid,HttpServletRequest request){
        GWCB gwcb = new GWCB();
        if((Integer) request.getSession().getAttribute("userid")==null){
            return "请先登入";
        }
        gwcb.setSpid(spid);
        gwcb.setUid((Integer) request.getSession().getAttribute("userid"));
        int i=gwcservice.Addgwc(gwcb);
        if(i==0){
            return "商品已添加";
        }
        if(i==1){
            return "添加成功";
        }
        return "未知原因添加失败";
    }

    @RequestMapping("authc/gwc")
    public ModelAndView gwc(HttpServletRequest request,Integer yema){
        if(yema==null){
            yema=1;
        }
        int count=10;
        int uid=(Integer) request.getSession().getAttribute("userid");
        List<GWCB> gwcs = gwcservice.finall(uid,yema,count);
        ModelAndView mv = new ModelAndView();
        int ymax=gwcservice.yemaMax(uid,count);
        mv.setViewName("gwc");
        mv.addObject("ymax",ymax);
        mv.addObject("yema",yema);
        mv.addObject("gwcs",gwcs);
        return mv;
    }

    @RequestMapping("authc/gwcsc")
    public String gwcsc(Integer spids[], HttpServletRequest request){
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        if(uid==null){
            return "请先登入";
        }
        Arrays.stream(spids).forEach(integer -> {gwcservice.DelGwc(uid,integer);});
        return "";
    }

    @RequestMapping("authc/gwcjz")
    public ModelAndView gwcjz(Integer spids[],BigDecimal zj,HttpServletRequest request){
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        ModelAndView mv = new ModelAndView();
        if(spids==null){
            mv.setViewName("forward:/authc/gwc");
            mv.addObject("ts","请先选择结账商品");
            return mv;
        }
        List<SPB> spbs = new ArrayList<SPB>();
        Arrays.stream(spids).forEach((spid)->spbs.add(spservice.finbyspid(spid)));
        mv.addObject("sps",spbs);
        List<SHDZB> shdzs = shdzService.finshdz(uid);
        if(shdzs.size()==0){
            mv.setViewName("forward:/authc/shdzck");
            mv.addObject("ts","请先添加收货地址");
        }else {
            mv.addObject("shdzs",shdzs);
            mv.addObject("zj",zj);
            mv.setViewName("jiezhan");
        }

        return mv;
    }

    @RequestMapping("authc/shdzck")
    public ModelAndView shdz(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        List<SHDZB> shdzs = shdzService.finshdz(uid);
        mv.setViewName("shdz");
        mv.addObject("shdzs",shdzs);
        return mv;
    }

    @RequestMapping("authc/shdzadd")
    public String shdzadd(HttpServletRequest request,String shdz,String phone){
        SHDZB shdzb = new SHDZB();
        shdzb.setPhone(phone);
        shdzb.setShdz(shdz);
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        shdzb.setUid(uid);
        int i=shdzService.Addshdz(shdzb);
        String str="";
        if(i==1){
            str="添加成功";
        }
        else{
            str="添加失败";
        }
        return str;
    }

    @RequestMapping("authc/shdzdel")
    public String shdzdel(HttpServletRequest request,int shdzid){
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        int i=shdzService.delshdz(shdzid,uid);
        String str="";
        if(i==1) {
            str="删除成功";
        }
        else{
            str="删除失败";
        }
        return str;
    }

    @RequestMapping("authc/shdzupd")
    public String shdzupd(HttpServletRequest request,String shdz,String phone,int shdzid){
        SHDZB shdzb = new SHDZB();
        shdzb.setPhone(phone);
        shdzb.setShdz(shdz);
        shdzb.setShid(shdzid);
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        shdzb.setUid(uid);
        int i=shdzService.updeteshdz(shdzb);
        String str="";
        if(i==1){
            str="修改成功";
        }
        else{
            str="修改失败";
        }
        return str;
    }

    @RequestMapping("authc/spjs")
    public String spjs(HttpServletRequest request,Integer spids[],Integer shdzid){
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        System.out.println(shdzid);
        Arrays.stream(spids).forEach((spid)->ddservice.GM(uid,spid,shdzid));
        return "下单成功";
    }

    @RequestMapping("authc/fspdd")
    public ModelAndView fspdd(HttpServletRequest request,Integer yema){
        ModelAndView mv = new ModelAndView();
        if(yema==null){
            yema=1;
        }
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        int count = 10;
        mv.setViewName("fddgl");
        List<DDB> dds = ddservice.sjdd(uid, yema, count);
        int i = ddservice.yemaMaxF(uid, count);
        mv.addObject("yema",yema);
        mv.addObject("ymax",i);
        mv.addObject("dds",dds);
        return mv;
    }

    @RequestMapping("authc/spfh")
    public String spfh(HttpServletRequest request,int ddid,String wlbh){
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        ddservice.fhdd(uid,ddid,wlbh);
        return "发货成功";
    }

    @RequestMapping("authc/sspdd")
    public ModelAndView sspdd(HttpServletRequest request,Integer yema){
        ModelAndView mv = new ModelAndView();
        if(yema==null){
            yema=1;
        }
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        int count = 10;
        mv.setViewName("sddgl");
        List<DDB> dds = ddservice.gmdd(uid, yema, count);
        int i = ddservice.yemaMaxH(uid, count);
        mv.addObject("yema",yema);
        mv.addObject("ymax",i);
        mv.addObject("dds",dds);
        return mv;
    }

    @RequestMapping("authc/spsh")
    public String spsh(HttpServletRequest request,int ddid){
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        ddservice.shdd(uid,ddid);
        return "收货成功";
    }

    @RequestMapping("/authc/gmsp/{spid}")
    public ModelAndView gmsp(@PathVariable("spid") int spid,HttpServletRequest request){
        Integer uid=(Integer) request.getSession().getAttribute("userid");
        ModelAndView mv = new ModelAndView();
        List<SPB> spbs = new ArrayList<SPB>();
        SPB finbyspid = spservice.finbyspid(spid);
        spbs.add(finbyspid);
        mv.addObject("sps",spbs);
        List<SHDZB> shdzs = shdzService.finshdz(uid);
        if(shdzs.size()==0){
            mv.setViewName("forward:/authc/shdzck");
            mv.addObject("ts","请先添加收货地址");
        }else {
            mv.addObject("shdzs", shdzs);
            mv.addObject("zj", finbyspid.getSpjg());
            mv.setViewName("jiezhan");
        }
        return mv;
    }

    @RequestMapping("/authc/zhuxiao")
    public ModelAndView zhuxiao(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/ym/anon/login");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        request.getSession().removeAttribute("userid");
        request.getSession().removeAttribute("uuid");
        return mv;
    }
}
