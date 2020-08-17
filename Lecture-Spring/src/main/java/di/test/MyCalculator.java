package di.test;

public class MyCalculator {
	
	private int firstNum = 15;
	private int secondNum = 4;
	private Calculator calculator;
	
	
	
	
	
	
	public MyCalculator() {
		super();
	}
	
	


	public MyCalculator(int firstNum, int secondNum, Calculator calculator) {
		super();
		this.firstNum = firstNum;
		this.secondNum = secondNum;
		this.calculator = calculator;
	}




	public MyCalculator(Calculator calculator) {
		super();
		
		this.calculator = calculator;
//		calculator.addition(firstNum, secondNum);
//		calculator.substraction(firstNum, secondNum);
//		calculator.multiply(firstNum, secondNum);
//		calculator.divide(firstNum, secondNum);
	}
	
	
	public void add() {
		
		calculator.addition(firstNum, secondNum);
		
	}
	public void sub() {
		
		calculator.substraction(firstNum, secondNum);
		
	}
	public void mul() {
		
		calculator.multiply(firstNum, secondNum);
		
	}
	public void div() {
		
		calculator.divide(firstNum, secondNum);
		
	}


	public int getFirstNum() {
		return firstNum;
	}


	public void setFirstNum(int firstNum) {
		this.firstNum = firstNum;
	}


	public int getSecondNum() {
		return secondNum;
	}


	public void setSecondNum(int secondNum) {
		this.secondNum = secondNum;
	}


	public Calculator getCalculator() {
		return calculator;
	}


	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
	
	


	
	
	

}
