package projectJeju;

import java.sql.Date;
import java.util.Calendar;
import java.util.Random;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jeju.app.boards.BoardDAO;
import com.jeju.app.boards.BoardDTO;
import com.jeju.app.publicBoards.PB_DTO;
import com.jeju.app.publicBoards.notice.NoticeDAO;

public class NoticeDAOTest extends Sample {
	
	@Autowired
	private NoticeDAO noticeDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	public void addtest() throws Exception {
		PB_DTO dto = new PB_DTO();
		Calendar ca = Calendar.getInstance();
		
		for (int i=0; i<115; i++) {
			dto.setUserID("test"+i);
			dto.setBoardDate(new Date(ca.getTimeInMillis()));
			dto.setBoardContents("testContents" +i);
			dto.setBoardTitle("testTitle" +i);
			
			noticeDAO.add(dto);
			
			if (i%100==0) {
				Thread.sleep(100);
			}
			
			System.out.println("Finish");
		}
	}

}
