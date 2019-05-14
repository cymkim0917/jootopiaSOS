package com.kh.jooTopia.member.util;

import javax.mail.Authenticator;

import javax.mail.PasswordAuthentication;



public class Gmail extends Authenticator {
    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
       System.out.println("beagles1004");
        return new PasswordAuthentication("beagles1004","hfcectmsixdnabpu");

    }
}