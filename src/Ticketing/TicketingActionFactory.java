package Ticketing;

import java.io.IOException;


public class TicketingActionFactory{
	private static TicketingActionFactory instance = new TicketingActionFactory();
	private TicketingActionFactory() { }
	public static TicketingActionFactory getInstance() {
		return instance;
	}
	public Action getAction(String command) {
		Action action = null;
		switch(command) {
		case "p1" : action = new TicketingP1(); break;
		case "p2" : action = new TicketingP2(); break;
		case "p2Ticket" : action = new TicketingProcess(); break;
		case "p3" : action = new TicketingPage3Action(); break;
		case "p4" : action = new TicketingPage4Action(); break;
		case "submit" : action = new TicketCreate(); break;
		/*
		 * case "plus": action = new PlusAction(); break; case "minus": action = new
		 * MinusAction(); break; case "multiply": action = new MultiplyAction(); break;
		 * case "divide": action = new DivideAction(); break; case "result": action =
		 * new ResultAction(); break;
		 */
		}
		return action;
	}
}