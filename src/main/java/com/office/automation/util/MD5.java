package com.office.automation.util;


import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;

import sun.misc.BASE64Encoder;
 
@Component
public class MD5 {
   /**����MD5���м���*/
  public String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException{
    //ȷ�����㷽��
    MessageDigest md5=MessageDigest.getInstance("MD5");
    BASE64Encoder base64en = new BASE64Encoder();
    //���ܺ���ַ���
    String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
    return newstr;
  }
   
  /**�ж��û������Ƿ���ȷ
   *newpasswd �û����������
   *oldpasswd ��ȷ����*/
  public boolean checkpassword(String newpasswd,String oldpasswd) throws NoSuchAlgorithmException, UnsupportedEncodingException{
    if(EncoderByMd5(newpasswd).equals(oldpasswd))
      return true;
    else
      return false;
  }
}
