package projectJeju;

import static org.junit.Assert.*;

import java.sql.Date;
import java.util.Calendar;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jeju.app.boards.BoardDAO;
import com.jeju.app.boards.BoardDTO;

public class BoardDAOTest extends Sample {
	
	@Autowired
	private BoardDAO boardDAO;

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
		BoardDTO boardDTO = new BoardDTO();
		Calendar ca = Calendar.getInstance();
		
		for (int i=0; i<50; i++) {
			boardDTO.setUserID("test"+i);
			boardDTO.setBoardDate(new Date(ca.getTimeInMillis()));
			boardDTO.setBoardContents("testContents" +i);
			boardDTO.setBoardTitle("testTitle" +i);
			boardDTO.setCategory(1L);
			boardDTO.setFavorite(1L);
			
			double r = Math.random();
			
			r = r*100;
			
			int ri = (int)r;
			
			r = ri/100.0;
			
			boardDTO.setRating(r);
			
			boardDAO.add(boardDTO);
			
			if (i%100==0) {
				Thread.sleep(100);
			}
			
			System.out.println("Finish");
		}
	}

}
