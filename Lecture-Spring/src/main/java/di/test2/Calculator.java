package di.test2;

public class Calculator {
	
//	private int result;
	
	
	
	public void addition(int firstNum, int secondNum) {
		
		System.out.println("덧셈결과: " + (firstNum + secondNum));
		
	}
	public void substraction(int firstNum, int secondNum) {
		
		System.out.println("뺼셈결과: " + (firstNum - secondNum));
		
	}
	public void multiply(int firstNum, int secondNum) {
		
		System.out.println("곱셈결과: " + (firstNum * secondNum));
		
	}
	public void divide(int firstNum, int secondNum) {
		
		System.out.println("나눗셈결과: " + ((double)firstNum / secondNum));
		
	}

}
