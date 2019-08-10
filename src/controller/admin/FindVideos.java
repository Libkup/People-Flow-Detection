package controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;

import javax.mail.search.StringTerm;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.javafx.util.TempState;

/**
 * Servlet implementation class FindVideos
 */
@WebServlet("/FindVideos")
public class FindVideos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindVideos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String current = request.getParameter("current");
		System.out.println(current);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String option = request.getParameter("option");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		int page = Integer.valueOf(request.getParameter("page"));
		String path = "F:/savedVideo";
		File file = new File(path);
		File[] files = null;
		if (file.exists()) {
			files = file.listFiles();
//            if (null != files) {
//                for (File file2 : files) {
//                     System.out.println("文件:" + file2.getName());
//                }
//            }
        } else {
            System.out.println("文件不存在!");
        }
		Date startFromUser = new Date(startTime);
		Date endFromUser = new Date(endTime);
		ArrayList<String> videosAddress = new ArrayList<>();
		ArrayList<String> tArrayList = new ArrayList<>();
		for(int i = 0; i < files.length; i++){
			if(files[i].getName().startsWith(option)){
				String starttemp = files[i].getName().split("--")[1];
				String endtemp = files[i].getName().split("--")[2];
				String[] starttemps = starttemp.split("-");
				String[] endtemps = endtemp.split("-");
				String dstarttemp = "";
				String dendtemp = "";
				for(int j = 0;j < starttemps.length; j++){
					if(j < 2){
						dstarttemp += starttemps[j] + "/"; 
						dendtemp += endtemps[j] + "/";
					}
					else if(j > 2){
						if(j < starttemps.length-1){
							dstarttemp += starttemps[j] + ":"; 
							dendtemp += endtemps[j] + ":";
						}else{
							dstarttemp += starttemps[j];
							dendtemp += endtemps[j].replace(".mp4", "");
						}
					}
					else {
						dstarttemp += starttemps[j] + " "; 
						dendtemp += endtemps[j] + " ";
					}
				}
//				System.out.println(starttemp);
//				System.out.println(dstarttemp);
//				System.out.println(dendtemp);
				dendtemp.replace(".mp4", " ");
				
				Date startFromFile = new Date(dstarttemp);
				Date endFromFile = new Date(dendtemp);
				if(startFromFile.after(startFromUser) && startFromFile.before(endFromUser) 
						||endFromFile.after(startFromUser) && endFromFile.before(endFromUser)){
					tArrayList.add(option + ":" + dstarttemp + " --- " + dendtemp);
					videosAddress.add(files[i].getName());
				}
					
			}
		}
//		System.out.println(startTime + " " + endTime);
		String result = "";
		int count = 0;
		for(String string : videosAddress){
			count ++;
			if(count <= (page-1)*8)
				continue;
			if(count == page*8+1)
				break;
			result += string + ",";
			
		}
			
		result += "|";
		count = 0;
		for(String string : tArrayList){
			count ++;
			if(count <= (page-1)*8)
				continue;
			if(count == page*8+1)
				break;
			result += string + ",";
			
		}
		count = 0;	
		for(String string : tArrayList){
			count ++;
		}
		result += "|";
		result += (int)count/8+1 + "," + page;
		response.getWriter().print(result);
		System.out.println(result);
	}

}
