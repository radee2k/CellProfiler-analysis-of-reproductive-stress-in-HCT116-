path_in = getDirectory("choose directory with files");

print("\\Clear");

Dialog.create("");
	Dialog.addString("imageset name", "");	
	Dialog.show();
	
n = Dialog.getString();

path_out = path_in + "max_intensity_projections_" + n

File.makeDirectory(path_out);

print(path_out);

list=getFileList(path_in);
	
for(i=0;i<list.length;i++){ 
	if (File.isDirectory(list[i]));
	else if (endsWith(list[i],".tif")){ 
		open(list[i]);
	
	title1 = File.nameWithoutExtension;
	title2 =getTitle();
	
	run("Z Project...", "projection=[Max Intensity]");
	
	rename(title1+"_max.tif");
	saveAs("tiff", path_out + "/" + title1 + "_max");
		
	print(title1);
	
	close(title1+"_max.tif");
    close(title2);

}
}

close();


print("yeah");

selectWindow("Log");


saveAs("Text", path_out + "/" + n + "_log.txt");

print("\\Clear");

print(path_in);
