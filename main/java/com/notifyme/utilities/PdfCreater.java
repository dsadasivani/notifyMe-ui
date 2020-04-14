package com.notifyme.utilities;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfCreater {

	    public static void writeDocument(String input) throws MalformedURLException, IOException {

	        Document document = new Document();

	        try {
	            PdfWriter.getInstance(document,
	                new FileOutputStream("C:\\Users\\vkalluri\\Desktop\\NotifyMe\\News.pdf"));

	            document.open();
	            
	            Image image1 = Image.getInstance("C:\\Users\\vkalluri\\Desktop\\NotifyMe\\NotifyMe.png");
	            /*image1.setAbsolutePosition(500f, 650f);*/
	            image1.scalePercent(50f);
	            document.add(image1);
	            document.add(new Paragraph(input));
	            document.close(); // no need to close PDFwriter?

	        } catch (DocumentException e) {
	            e.printStackTrace();
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        }

	    }
	}

