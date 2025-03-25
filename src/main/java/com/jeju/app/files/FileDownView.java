package com.jeju.app.files;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class FileDownView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("fileDown View");
		
		FileDTO fileDTO = (FileDTO)model.get("file");
		String path = (String)model.get("kind");
		
		path = request.getSession().getServletContext().getRealPath("/resources/images/"+path+"/");
		
		File file = new File(path, fileDTO.getFileName());
		
		response.setCharacterEncoding("UTF-8");
		
		response.setContentLength((int)file.length());
		
		String name = fileDTO.getOldName();
		
		name = URLEncoder.encode(name, "UTF-8");
		
		response.setHeader("Content-Dispostion", "attachment;fileName=\""+name+"\"");
		response.setHeader("Content-transfer-Encoding", "binary");
		
		FileInputStream fi = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fi, os);
		
		os.close();
		fi.close();
		
	}
	
	
	
}
