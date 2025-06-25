package control;

import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet(name = "ImageServlet", value = "/image")
public class ImageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.创建一个内存的图片，该类BufferedImage,并设置其初始化大小
        response.setContentType("image/jpeg");
        int width=100;
        int height=30;//对应的是像素px
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //2.得到属于该画布的一个画笔Graphics
        Graphics g=image.getGraphics();
        //3.给画布画边框
        g.setColor(Color.lightGray);//设置边框的颜色
        g.drawRect(0, 0, width, height);
        //4.填充画布
        g.setColor(Color.YELLOW);
        g.fillRect(2, 2, width-4, height-4);
        //5.定义画布上可以放那些验证码
        char[] chars="ABCDEFGHIJKLMNOPQRSTabcdefghijklmn0123456789".toCharArray();
        StringBuilder sb=new StringBuilder();
        Random random=new Random();
        //6.生成的4个随机字符
        String code="";
        for(int i=1;i<=4;i++) {
            int n=random.nextInt(chars.length);
            sb.append(chars[n]+" ");
            code+=chars[n];
        }
        //7.把随机字符保存到会话Session域中，以便登录时比较使用
        HttpSession session = request.getSession();
        session.setAttribute("checkcode", code);
        System.out.println("会话ID:"+session.getId()+"，保存了code="+code);

        //8.把产生的验证码设置到画布上去
        g.setColor(Color.RED);
        //设置字体
        g.setFont(new Font("宋体",Font.BOLD|Font.ITALIC,18));
        g.drawString(" "+sb.toString(), 5, 20);
        //9.在画布上设置干扰点或设置干扰线
        for(int i=1;i<=50;i++) {
            //设置干扰点的颜色
            g.setColor(Color.green);
            int x=random.nextInt(width);
            int y=random.nextInt(height);
            //画的是一个椭圆（干扰点的大小由椭圆大小决定），width表示是宽上的半径，height表示高上的半径
            g.drawOval(x, y, 1, 1);
        }
        //如果设置干扰线的话
        for(int n=1;n<=6;n++) {
            g.setColor(Color.blue);
            int x1=random.nextInt(width);
            int x2=random.nextInt(height);
            int y1=random.nextInt(width);
            int y2=random.nextInt(height);
            //画干扰线
            g.drawLine(x1, y1, x2, y2);
        }
        //10.把该画布给客户端显示出去
        ImageIO.write(image, "jpg", response.getOutputStream());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
