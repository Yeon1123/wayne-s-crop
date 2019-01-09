import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class FileSave {
	public static void main(String args[]) throws IOException {
		try {
			Crawl c = new Crawl();
			
			String text = c.getDiv("https://ko.weatherspark.com/y/14754/%EB%AF%B8%EA%B5%AD-%EC%9D%B8%EB%94%94%EC%95%A0%EB%82%98-%EC%A3%BC-%EC%9D%B8%EB%94%94%EC%95%A0%EB%82%98%ED%8F%B4%EB%A6%AC%EC%8A%A4%EC%9D%98-%EB%85%84%EC%A4%91-%ED%8F%89%EA%B7%A0-%EB%82%A0%EC%94%A8");
			String fileNm = "C:\\Users\\PandoraBox\\Desktop\\2018\\2018_winter\\wayne-s-crop\\Weather\\crawl_file.txt";
			
			File file = new File(fileNm);
			FileWriter fileWrite = new FileWriter(file, true);
			
			fileWrite.write(text);
			fileWrite.flush();
			fileWrite.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
