package org.xs.techblog.common.components.qiniu;

import java.io.File;

import org.xs.techblog.common.config.Global;
import org.xs.techblog.common.utils.IdGen;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * 七牛上传帮助类
 */
public class QiniuHelper {
	
    /**
     * 空间名
     */
    private static String Scope = Global.getConfig("ueditor.qiniuScope");
    
    /**
     * 域名
     */
    private static String Url = Global.getConfig("ueditor.qiniuUrl");
    
    /**
     * 公钥
     */
    private static String ACCESS_KEY = Global.getConfig("ueditor.ACCESS_KEY");
    
    private static String SECRET_KEY = Global.getConfig("ueditor.SECRET_KEY");
    
    /**
     * 上传附件
     * @throws QiniuException 
     */
    public static String UploadFile(File file) throws QiniuException {
    	
    	String key = IdGen.uuid();
    	
    	try {
	    	//创建上传对象
	    	UploadManager uploadManager = new UploadManager();
	    	
	    	//密钥配置
	    	Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	    	
	    	//上传文件
	    	Response res = uploadManager.put(file, key, auth.uploadToken(Scope, key));
    	} catch (Exception e) {
    		return "";
    	}
    	return key;
    }
    
    /**
     * 获得url地址
     */
    public static String GetUrl(String key)
    {
        return String.format ("http://%s/%s", Url, key);
    }
}
