package dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class testCMD {

	public testCMD() {
		// TODO Auto-generated constructor stub
	}
	
	public static void main(String[] args) throws Exception { 
		String [] cmd={"cmd","/C","ffmpeg -i rtmp://localhost:1935/live/camera1 -c:v copy -c:a copy -bsf:a aac_adtstoasc F:/test1.mp4"};
//		Process proc =Runtime.getRuntime().exec(cmd);
		String command = "ipconfig -all";
		String ip = "IPv4";
        String line = null;
		Runtime run = Runtime.getRuntime();
        try {
            java.lang.Process process = run.exec("cmd.exe /k"+"ffmpeg -i rtmp://localhost:1935/live/camera1 -c:v copy -c:a copy -bsf:a aac_adtstoasc F:/test1.mp4");
            BufferedReader bufferReader=new BufferedReader(new InputStreamReader(process.getInputStream()));
            Runtime.getRuntime().exec("q");
            while((line = bufferReader.readLine()) != null){
//                sb.append(line+"/n");
//                if(line.contains(ip)){
                    System.out.println(line);
//                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
