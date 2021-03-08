import java.util.List;
import java.util.stream.Collectors;
import java.nio.file.Paths;
import java.util.Arrays;
import java.nio.file.Files;
import java.util.stream.Stream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.*;
public class Covid
{
  // You can add your own variables between them.

  // You can add your own variables between them.

  // You must not change between them.
  private List<List<String>> rows;

  public Covid()
  {
    try
    {
      this.rows = Files
  				.lines(Paths.get("covid19.csv"))
  				.map(row -> Arrays.asList(row.split(",")))
  				.collect(Collectors.toList());
    }
    catch (IOException e)
    {
			e.printStackTrace();
		}
  }
  // You must not change between them.

  public void printOnlyCases(String location, String date)
  {

  	for(int i=0; i < rows.size(); i++){
  		if(rows.get(i).get(1).equals(location) && rows.get(i).get(2).equals(date)){
  			int result = (Integer.parseInt(rows.get(i).get(3)) - Integer.parseInt(rows.get(i).get(5)));
  			System.out.printf("Result: %d%n", result);
  		}
  	}


  }

  public long getDateCount(String location)
  {
  	long toReturn = 0;
  	for(int i=0; i < rows.size(); i++){
  		if(rows.get(i).get(1).equals(location)){
  			toReturn++;
  		}
  	}
    return toReturn;
  }
  public long getDateCountCode(String code)
  {
  	long toReturn = 0;
  	for(int i=0; i < rows.size(); i++){
  		if(rows.get(i).get(0).equals(code)){
  			toReturn++;
  		}
  	}
    return toReturn;
  }

  public int getCaseSum(String date)
  {
    int toReturn = 0;
    for(int i=0; i < rows.size(); i++){
    	if(rows.get(i).get(2).equals(date)){
    		toReturn = toReturn + Integer.parseInt(rows.get(i).get(4));
    	}
    }

    return toReturn;
  }

  public long getZeroRowsCount(String location)
  {
    long toReturn = 0;
    for(int i=0; i < rows.size(); i++){
    	if(rows.get(i).get(1).equals(location) && (rows.get(i).get(6).equals("0") && rows.get(i).get(3).equals("0") && rows.get(i).get(4).equals("0") && rows.get(i).get(5).equals("0"))){
    		toReturn++;
    	}
    }
    return toReturn;
  }

  public double getAverageDeath(String location)
  {
  	int count = 0;
    double toReturn = 0;
    for(int i=0; i < rows.size(); i++){
    	if(rows.get(i).get(1).equals(location)){
    		count++;
    		toReturn = toReturn + Integer.parseInt(rows.get(i).get(6));
    	}
    }
    toReturn = toReturn/count;
    toReturn = Double.parseDouble(new DecimalFormat("##.00").format(toReturn));
    return toReturn;
  }

  public String getFirstDeathDayInFirstTenRows(String location)
  {
    String toReturn = null;
    int flag = 0;
    for(int i=0; i < rows.size(); i++){
    	if(rows.get(i).get(1).equals(location) && flag < 10){
    		if(!(rows.get(i).get(6).equals("0"))){
    			return toReturn =  rows.get(i).get(2);
    		}
    		flag++;
    	}
    }
    toReturn =   "Not Found";
    return toReturn;
  }
  public String getFirstDeathDayInFirstTenRows2(String location)
  {
    String toReturn = null;
  
    for(int i=0; i < rows.size(); i++){
    	if(rows.get(i).get(1).equals(location)){
    		if(!(rows.get(i).get(6).equals("0"))){
    			return toReturn =    rows.get(i).get(2)   ;
    		}
    		
    	}
    }
    toReturn =   "Not Found"  ;
    return toReturn;
  }
  public String[] getDateCountOfAllLocations()
  {
    List<String> result = new ArrayList<>();

    List<String> country = new ArrayList<>();
    for(int i=0; i < (rows.size()-1); i++){
    	if(!(rows.get(i).get(0).equals(rows.get(i+1).get(0)))){
    		country.add(rows.get(i).get(0));
    	}
    	//System.out.println((rows.get(i).get(0)));
  	}
  	String[] toReturn = new String[country.size()];
  	country.add(rows.get(rows.size()-1).get(0));
  	for(int j=0; j< country.size(); j++){
  		result.add( country.get(j)+ ": " + getDateCountCode(country.get(j)) );
  	}
  	
    toReturn = result.toArray(toReturn);
    return toReturn;
  }

  public List<String> getLocationsFirstDeathDay()
  {
    List<String> toReturn = new ArrayList<>();


    List<String> country = new ArrayList<>();
    for(int i=0; i < (rows.size()-1); i++){
    	if(!(rows.get(i).get(1).equals(rows.get(i+1).get(1)))){
    		country.add(rows.get(i).get(1));
    	}
    	//System.out.println((rows.get(i).get(0)));
  	}
  	
  	country.add(rows.get(rows.size()-1).get(1));
  	for(int j=0; j< country.size(); j++){
  		toReturn.add(country.get(j)+ ": " + getFirstDeathDayInFirstTenRows2(country.get(j)));
  	}
  	
    
    return toReturn;
  }

  public String trimAndGetMax(String location, int trimCount)
  {
  	List<List<String>> rows1 = new ArrayList<>();
  	for(int t=0;t<rows.size();t++){
  		rows1.add(rows.get(t));
  	}
  	
    String toReturn = null;
    String date = null;
    int start=0;
    int finish=0;
    int max=0;
    boolean flag = true;
    for(int k=0; k< rows1.size();k++){
    	
    	if(rows1.get(k).get(1).equals(location) && flag){
    		start = k;
    		flag = false;
    	}
    	else if(rows1.get(k).get(1).equals(location) && !flag){
    		finish = k;
    	}
    	
    }
    List<String> temp = new ArrayList<>();
    temp.add("0");
    temp.add("0");
    temp.add("0");
    temp.add("0");
    temp.add("0");
    temp.add("0");
    temp.add("0");

    for(int i=start; i<finish+1; i++){
    	
    	for(int j = start+1; j < finish+start+1-i;j++){
    		
    		if(Integer.parseInt(rows1.get(j-1).get(4)) > Integer.parseInt(rows1.get(j).get(4))){
    			temp.set(0,rows1.get(j-1).get(0)) ;
    			temp.set(1,rows1.get(j-1).get(1));
    			temp.set(2,rows1.get(j-1).get(2));
    			temp.set(3,(rows1.get(j-1).get(3)));
    			temp.set(4,(rows1.get(j-1).get(4)));
    			temp.set(5,(rows1.get(j-1).get(5)));
    			temp.set(6,(rows1.get(j-1).get(6)));
    			rows1.get(j-1).set(0,(rows1.get(j).get(0)));
    			rows1.get(j-1).set((1),(rows1.get(j).get(1)));
    			rows1.get(j-1).set((2),(rows1.get(j).get(2)));
    			rows1.get(j-1).set((3),(rows1.get(j).get(3)));
    			rows1.get(j-1).set((4),(rows1.get(j).get(4)));
    			rows1.get(j-1).set((5),(rows1.get(j).get(5)));
    			rows1.get(j-1).set((6),(rows1.get(j).get(6)));
    			rows1.get(j).set((0),(temp.get(0)));
    			rows1.get(j).set((1),(temp.get(1)));
    			rows1.get(j).set((2),(temp.get(2)));
    			rows1.get(j).set((3),(temp.get(3)));
    			rows1.get(j).set((4),(temp.get(4)));
    			rows1.get(j).set((5),(temp.get(5)));
    			rows1.get(j).set((6),(temp.get(6)));
    		}
    	}
    }
    for(int n=0; n<trimCount;n++){
    	rows.remove(start);
    }
    for(int h=0;h<trimCount;h++){
    	rows.remove(finish-5-h);
    }
    for(int k = start+trimCount; k<finish+1-trimCount;k++){
    	if(max < Integer.parseInt(rows1.get(k).get(6))){
    		date = rows1.get(k).get(2);
    		max = Integer.parseInt(rows1.get(k).get(6));
    	}

    }
    toReturn =  date+ " " + max ;

    return toReturn;
  }

  public List<List<String>> getOnlyCaseUpDays(String location)
  {
    List<List<String>> toReturn = new ArrayList<>();
    int notzero = 0;
    for(int i=0; i<rows.size();i++){
    	if(rows.get(i).get(1).equals(location) && !(Integer.parseInt(rows.get(i).get(4)) == 0 )){
    		
    		toReturn.add(notzero,rows.get(i));
    		notzero++;
    	}
    }
    System.out.println(notzero);
    
    return toReturn;
  }

  public static void main(String[] args)
  {
  	
  	
  
  	
  }
}

