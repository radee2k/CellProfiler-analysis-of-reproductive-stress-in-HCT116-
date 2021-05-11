path_in = getDirectory("choose directory with files");

print("\\Clear");

Dialog.create("");
	Dialog.addString("imageset name", "");	
	Dialog.show();
	
n = Dialog.getString();

path_out = path_in + "slices_" + n

File.makeDirectory(path_out);
print(path_out);
list = getFileList(path_in);
	
for(i = 0; i < list.length; i++) { 
	if (File.isDirectory(list[i]));
	else if (endsWith(list[i], ".tif")){ 
		open(list[i]);
	
	title1 = File.nameWithoutExtension;
	title2 = getTitle();
    
	for (c = 1; c < 20; c++) {
		run("Next Slice [>]");
		}
	
	run("Brightness/Contrast...");
	resetMinAndMax();

	waitForUser('choose which slice would You like to select with the scrolling wheel, THEN press OK');

	sl = getSliceNumber();	

	run("Make Substack...", "slices=" + sl + "-" + sl + "");

		
	rename(title1 + "_slice.tif");
	saveAs("tiff", path_out + "/" + title1 + "_slice");
	
	print(title1);
	
	close(title1 + "_slice.tif");
  close(title2);
}
}

print("end");
selectWindow("Log");

saveAs("Text", path_out + "log.txt");

print("\\Clear");

print(path_in);
print('log saved in the output folder')
