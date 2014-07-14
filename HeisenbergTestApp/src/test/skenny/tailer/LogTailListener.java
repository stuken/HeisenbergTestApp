package test.skenny.tailer;

import java.util.ArrayList;

import org.apache.commons.io.input.Tailer;
import org.apache.commons.io.input.TailerListener;

public class LogTailListener implements TailerListener {
	private ArrayList<String> lst;
	
	public LogTailListener(ArrayList<String> lst) {
		this.lst = lst;
	}

	@Override
	public void fileNotFound() {
		// TODO Auto-generated method stub

	}

	@Override
	public void fileRotated() {
		// TODO Auto-generated method stub

	}

	@Override
	public void handle(String arg0) {
		this.lst.add(arg0);

	}

	@Override
	public void handle(Exception arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void init(Tailer arg0) {
		// TODO Auto-generated method stub

	}

}
