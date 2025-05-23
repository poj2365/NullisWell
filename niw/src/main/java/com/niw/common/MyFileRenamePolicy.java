package com.niw.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File f) {
		String oriName = f.getName();
		File newFile = null;
		do {
			String prefix = "niw_";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			int rnd = (int) (Math.random() * 10000) + 1;
			String ext = oriName.substring(oriName.indexOf("."));
			String rename = prefix + sdf.format(new Date()) + "_" + rnd + ext;
			newFile = new File(f.getParent(), rename);
		} while (!createFile(newFile));

		return newFile;
	}

	private boolean createFile(File newFile) {
		try {
			return newFile.createNewFile();
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
}
