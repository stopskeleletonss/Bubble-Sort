String[] readvalues, splitvalues; //string arrays for reading the values from the csv file and for splitting the joined data from the csv file
String combinevalues; //string that combines the data from the csv file 
int[] numvalues; //int array for switching the data from the csv file to numerical
int temp; //variable that temporarily holds a value in order for the two values being compared to switch

void setup() {
  valuesetup();
  sortvalues();
  splitvalues = str(numvalues); //converts the numerical values in the splitvalues array back into strings
  saveStrings("random_numbers.csv", splitvalues); //saves the sorted data back into the csv file
  println(numvalues); //shows in the console window that the values have been sorted
}

void valuesetup() { //function to prepare the values from the csv file to be sorted
  readvalues = loadStrings("random_numbers.csv"); //loads the data from the file into the readvalues array
  combinevalues = join(readvalues, ","); //combines the values held in the readvalues array into one line
  splitvalues = split(combinevalues, ","); //splits the values held in the combinevalues array back into their own separate lines
  numvalues = int(splitvalues); //converts the strings held in the splitevalues array to numerical values
}

void sortvalues() { //function that sorts the values from least to greatest by comparingthem to the adjacent value to the right
    for (int index = 0; index < splitvalues.length; index++) { //index variable has an initial value of 0, must be less than the length of splitvalues array, and increases by increments of 1
    for (int index1 = 0; index1 < splitvalues.length-index-1; index1++) { //index1 variable has an initial value of 0, must be less than the length of splitvalues array minus the value of index and an additional -1, and increases by increments of 1
      if (numvalues[index1] > numvalues[index1+1]) { //if a value in the array is larger than the next value in the array
        temp = (numvalues[index1]); //the value of the larger number is stored in the temp variable
        numvalues[index1] = numvalues[index1+1]; //the smaller number moves to the position in the array that contained the larger number
        numvalues[index1+1] = (temp); //the larger number moves to the position in the array that contained the smaller number
      }
    }
  }
}
