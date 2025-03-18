import static org.junit.Assert.assertNotEquals;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.tools.reflect.Sample;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.springframework.beans.factory.annotation.Autowired;

import com.jeju.app.boards.BoardDAO;
import com.jeju.app.boards.BoardDTO;

public class productDAOTest extends Sample {
	
	@Autowired
	private BoardDAO boardDAO;
	
	@BeforeClass
	public static void bf() {
		System.out.println("전체 테스트 시작 전");
	}
	
	@AfterClass
	public static void af() {
		System.out.println("전체 테스트 종료 후");
	}
	
	@Before
	public void fe() {
		System.out.println("개별 테스트 실행 전");
	}
	
	@After
	public void ae() {
		System.out.println("개별 테스트 실행 후");
	}
	
	@Test
	public void getListTest() throws Exception{
		System.out.println("getList Test");
		BoardDTO boardDTO = new BoardDTO();
		List<BoardDTO> ar = new ArrayList<BoardDTO>();
		ar = boardDAO.getList(boardDTO);
		assertNotEquals(0, ar.size());
	}

}
