package bookMarket.ver01.dao;
import bookMarket.ver01.dto.Book;


import java.util.ArrayList;


public class BookRepository {

	private ArrayList<Book> listOfBooks = new ArrayList<Book>();

	
	private static BookRepository instance = new BookRepository(); // 추가 코드
	
	public static BookRepository getInstance() { //추가 코드
		return instance;
	}
	
	public BookRepository() {
		Book book1 = new Book("a111", "모든 것은 기본에서 시작한다", 14400);
		book1.setAuthor("손웅정");
		book1.setDescription("축구선수로서의 삶, 아버지로서의 삶, 지도자로서의 삶 자신의 삶에 대한 반성과 성찰로 빚어낸 강건한 신념과 철학! “나의 축구는 온전히 아버지의 작품이다”-손흥민");
		book1.setPublisher("|수오서재|");
		book1.setCategory("[에세이]");
		book1.setUnitsInStock(10);
		book1.setTotalPages(300);
		book1.setReleaseDate("2021년 10월 15일");
		book1.setCondition("New");
		book1.setFileName("a111.png");
		
		Book book2 = new Book("a222", "쉬운천국", 11000);
		book2.setAuthor("유지혜");
		book2.setDescription("이제 조금 알 것 같다는, 혹은 아직도 잘 모르겠다는 너와 나, 우리 청춘들에게 바치는 몇만 번 다시 사랑하게 될 순간들의 기록");
		book2.setPublisher("|어떤책|");
		book2.setCategory("[에세이]");
		book2.setUnitsInStock(5);
		book2.setTotalPages(277);
		book2.setReleaseDate("2020년 11월 24일");
		book2.setCondition("Refurbished");
		book2.setFileName("a222.png");
		
		Book book3 = new Book("a333", "파친코", 8000);
		book3.setAuthor("이민진");
		book3.setDescription("“내게 ‘한국인’은 이야기의 주인공이 될 가치가 있는 이들이다. 나는 가능한 한 오래 한국인 이야기를 쓰고 싶다.” ‘한국 독자들에게’ 중에서");
		book3.setPublisher("|인플루엔셜|");
		book3.setCategory("[장편소설]");
		book3.setUnitsInStock(8);
		book3.setTotalPages(427);
		book3.setReleaseDate("2022년 8월 5일");
		book3.setCondition("old");
		book3.setFileName("a333.png");
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	//제품목록에서 상세페이지 펼칠 때 어떤 제품인지 알기 위해서 해당되는 제품을 찾는거.(아이디로)
	public Book getBookById(String bookId) {
		Book bookById=null;
		
		for(int i=0; i<listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if(book != null && book.getBookId() != null && book.getBookId().equals(bookId)) {
				bookById=book;
				break;
			}
		}
		return bookById;
	}
	
	public void addBook(Book book) { //추가 코드
		listOfBooks.add(book);
	}
}
