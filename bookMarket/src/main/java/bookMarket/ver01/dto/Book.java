package bookMarket.ver01.dto;

public class Book {

	private String bookId; //도서 아이디
	private String name; //도서명
	private Integer unitPrice; //가격
	private String autor; //저자
	private String description; //설명
	private String publisher; //출판사
	private String category; //분류
	private long unitsInStock; //재고 수
	private long totalPages; //페이지 수
	private String releaseDate; //출판일(월/년)
	private String condition;// 신규 도서 or 중고 도서 or e-book
	
	private String fileName; //이미지 파일명
	private int quantity; //장바구니에 담은 개수
	
	
	public Book(){
		super();
	}

	public Book(String bookId, String name ,Integer unitPrice) {
		this.bookId=bookId;
		this.name=name;
		this.unitPrice=unitPrice;
	}
	
	
	public String getBookId() {
		return bookId;
	}


	public void setBookId(String bookId) {
		this.bookId = bookId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getUnitPrice() {
		return unitPrice;
	}


	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}


	public String getAutor() {
		return autor;
	}


	public void setAutor(String autor) {
		this.autor = autor;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public long getUnitsInStock() {
		return unitsInStock;
	}


	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}


	public long getTotalPages() {
		return totalPages;
	}


	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}


	public String getReleaseDate() {
		return releaseDate;
	}


	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}

	

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
