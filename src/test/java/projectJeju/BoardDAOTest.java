package projectJeju;

import static org.junit.Assert.*;

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
		Random rg = new Random();
		
		for (int i=0; i<12; i++) {
			boardDTO.setUserID("test"+i);
			boardDTO.setBoardDate(new Date(ca.getTimeInMillis()));
			boardDTO.setBoardContents("제주시" +i);
			boardDTO.setBoardTitle("testTitle" +i);
			boardDTO.setFavorite(1L*i);
			boardDTO.setBoardHits(300L-(1L*i));
			boardDTO.setLocation("제주시");
			boardDTO.setCategory(3L);
			
			double r = Math.random();
			
			r = r*100;
			
			int ri = (int)r;
			
			r = ri/100.0;
			
			boardDTO.setRating(r);
			
			boardDAO.add(boardDTO);
			
			if (i%100==0) {
				Thread.sleep(10);
			}
			
			System.out.println("Finish");
		}
	}

}
