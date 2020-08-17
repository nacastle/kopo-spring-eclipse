package di.collection;

import java.util.List;

public class ListAddress {
	
	private List<String> address;
	private List<Integer> numbers;
	

	
	
	public ListAddress() {
		super();
	}
	
	 

	public ListAddress(List<String> address, List<Integer> numbers) {
		super();
		this.address = address;
		this.numbers = numbers;
	}


	public ListAddress(List<String> address) {
		super();
		this.address = address;
	}

	
	
	public List<Integer> getNumbers() {
		return numbers;
	}



	public void setNumbers(List<Integer> numbers) {
		this.numbers = numbers;
	}



	public List<String> getAddress() {
		return address;
	}

	public void setAddress(List<String> address) {
		this.address = address;
	}
	
	
	

}