package com.zjz.utils;

import java.util.UUID;


public class UploadUtils {
    /**
     * 生成唯一的文件名
     *
     * @param fileName 前端传入文件名
     * @return UuidFileName
     */
    public static String getUuidFileName(String fileName) {
        int i = fileName.lastIndexOf(".");
        String extions = fileName.substring(i);
        // 唯一 字符串  fsd-sfsdf-sfsd-sdfsd
        return UUID.randomUUID().toString().replace("-", "") + extions;
    }

    /**
     * 目录分离
     * 根据唯一文件名生成路径
     *
     * @param uuidFilename 唯一文件名
     * @return Path
     */
    public static String getPath(String uuidFilename) {
        int code1 = uuidFilename.hashCode();
        int d1 = code1 & 0xf;       //一级目录
        int code2 = code1 >>> 4;
        int d2 = code2 & 0xf;       //二级目录
        return "/" + d1 + "/" + d2;
    }
}
