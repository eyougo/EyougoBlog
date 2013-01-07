package com.eyougo.blog.web.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.eyougo.blog.comm.EyougoConstant;
import com.google.code.kaptcha.Producer;

@Controller
public class CaptchaImageController {
	private Producer captchaProducer = null;
    
    @Autowired
    public void setCaptchaProducer(Producer captchaProducer) {
            this.captchaProducer = captchaProducer;
    }

    @RequestMapping("/captcha")
    public ModelAndView handleRequest(HttpServletResponse response, HttpSession session, OutputStream outputStream) throws Exception {
            // Set to expire far in the past.
            response.setDateHeader("Expires", 0);
            // Set standard HTTP/1.1 no-cache headers.
            response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
            response.addHeader("Cache-Control", "post-check=0, pre-check=0");
            // Set standard HTTP/1.0 no-cache header.
            response.setHeader("Pragma", "no-cache");
              
            // return a jpeg
            response.setContentType("image/jpeg");

            // create the text for the image
            String capText = captchaProducer.createText();
            
            // store the text in the session
            session.setAttribute(EyougoConstant.KAPTCHA_SESSION_KEY, capText);
            
            // create the image with the text
            BufferedImage bi = captchaProducer.createImage(capText);
            
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(bi, "jpg", baos);
            byte[] jpegData = baos.toByteArray();
            response.setHeader("Content-Length", String.valueOf(jpegData.length));
            
            // write the data out
            ImageIO.write(bi, "jpg", outputStream);
            try
            {
            	outputStream.flush();
            }
            finally
            {
            	outputStream.close();
            }
            return null;
    }
}
