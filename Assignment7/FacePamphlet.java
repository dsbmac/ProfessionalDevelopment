/* 
 * File: FacePamphlet.java
 * -----------------------
 * When it is finished, this program will implement a basic social network
 * management system.
 */

import acm.program.*;
import acm.graphics.*;
import acm.util.*;
import java.awt.event.*;
import javax.swing.*;

public class FacePamphlet extends Program 
					implements FacePamphletConstants {

	/**
	 * This method has the responsibility for initializing the 
	 * interactors in the application, and taking care of any other 
	 * initialization that needs to be performed.
	 */
	public void init() {
		createDisplay();
    }    
	
	private void createDisplay() {
		centerDisplay = new FacePamphletCanvas();		
		addTopBar();
		addSideBar();
		add(centerDisplay,CENTER);		
		addActionListeners();
	}
	
	private void addTopBar() {
		nameLabel = new JLabel("Name");
		nameField = new JTextField(TEXT_FIELD_SIZE);
		nameAdd = new JButton("Add");
		nameDelete = new JButton("Delete");
		nameLookup = new JButton("Lookup");
		
		add(nameLabel,NORTH);
		add(nameField,NORTH);
		add(nameAdd,NORTH);
		add(nameDelete,NORTH);
		add(nameLookup,NORTH);
	}

	private void addSideBar() {
		statusField = new JTextField(TEXT_FIELD_SIZE);
		statusChange = new JButton("Change Status");
		pictureField = new JTextField(TEXT_FIELD_SIZE);
		pictureChange = new JButton("Change Picture");
		friendField = new JTextField(TEXT_FIELD_SIZE);
		addFriend = new JButton("Add Friend");
		
		add(statusField,WEST);
		add(statusChange,WEST);
		addEmptyLabel(WEST);
		
		add(pictureField,WEST);
		add(pictureChange,WEST);
		addEmptyLabel(WEST);
		
		add(friendField,WEST);		
		add(addFriend,WEST);
		
		statusChange.addActionListener(this);
		pictureChange.addActionListener(this);
		addFriend.addActionListener(this);
	}
	
	private void addEmptyLabel(String location) {
		JLabel emptyLabel = new JLabel(EMPTY_LABEL_TEXT);
		add(emptyLabel, location);
	}
	
    /**
     * This class is responsible for detecting when the buttons are
     * clicked or interactors are used, so you will have to add code
     * to respond to these actions.
     */
    public void actionPerformed(ActionEvent e) {
    	Object source = e.getSource();
		if (source == nameAdd) {
			System.out.println("nameField");
			centerDisplay.showMessage(nameField.getText());
		} else if (source == statusChange) {
			System.out.println("statusField");
			centerDisplay.showMessage(statusField.getText());
		}
//				if (e.getSource() == pictureChange)
//					if (e.getSource() == addFriend);
	}

    private FacePamphletCanvas centerDisplay;
    private JLabel nameLabel;
	private JTextField nameField;
	private JTextField statusField;
	private JTextField pictureField;
	private JTextField friendField;
	private JButton nameAdd;
	private JButton nameDelete;
	private JButton nameLookup;
	private JButton statusChange;
	private JButton pictureChange;
	private JButton addFriend;

}
