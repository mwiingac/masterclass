	

	

*		[Project]		Stata Introductory [Training]
*		[Purpose]		Attempting the Stata assignment
*		[Client]		Personal development
*		[Input]			Simulated data
*		[Output]		Simulated data
*		[Date]			May 2023
*		[Author]		Mwiinga Cheelo 	
						*	0.0.1
						//	Change author to your own name
		
		
		
		
		
*	SECTION [1]		Set up
		
		cls
		clear all
		
		* 1.1.1
		//change the version number to 16 or 17 or 18
		version
		set more off
		set trace off
		set seed 246813579
		
		*	1.1.2 
		//	change the maxvar value to 4000 
		set maxvar 2
		
		capture log close
		
		
		
		
		
*	SECTION [2]		Defininging Paths to Files and Folders
		
		
		*	2.1	storing your own username
		global my_name = lower("Mwiinga") 
			* 2.1.1
			// replace "Mwiinga" above (2.1) with your first name
		
		display "${my_name}"
		
		*	2.2 creating your working directory using your username
		capture mkdir "./${my_name}"
		
		*	2.3	creating logfile in your working directory
		log using ///
			"./${my_name}_stata_intro_practice_$S_DATE.smcl", ///
				replace
		
		*	2.4 storing name of data folder 
		global 	data_folder	"./${my_name}/data/"
		
		*	2.5	creating the data folder
		capture mkdir "${data_folder}"
						
			
			
		
*	SECTION [3]		Creating Data File for You
			
			//	This section will automatically create your data
			//	It will save the data in your data folder that was
			//	created in step 1.5 above
		
		*	3.1	sets the number of observations for the data we 
			*	will create
		set obs 1000
		
		
		*	3.2 creates a variable counting the observation, 1 to 1000
		generate counter = _n
			
			* 3.2.1
			// Label the variable counter as "Count of 1 to 1000"
			// Provide this description to all the variables you will 
			// generate in this do file
			
		
		
		*	3.3	creates a variable called gender
			//	Gender is randomly assigned
			
		generate gender = runiformint(0,1)
			* 3.3.1
			// Label define gender
			// Key: 0 = Female, 1 = Male
			
			
		
		
		*	3.4	creates a variable called classes
			
			//	Classes is randomly assigned
		
		generate classes =  runiformint(1,3)
			
			* 3.4.1
			//	recode the varible classes and generate class_name
			//	Key: 1 for class A (1 = A), 2 = B, 3 = B
			
		
		
		*	3.5	creates a variable called province
			
			//	Province is randomly assigned
		generate province = runiformint(1,3)	
			
			* 3.5.1
			// Label define and values for province
			// Key: 1 = Central, 2 = Copperbelt, 3 = Lusaka
			
		
		
		*	3.6	creates a variable called district
			
			//	District is randomly assigned
		generate district = .
		replace district = runiformint(1,3)	if province == 1
		replace district = runiformint(4,6)	if province == 2
		replace district = runiformint(7,9)	if province == 3
		label define district ///
			1 "Chibombo" 2 "Kabwe" 3 "Luano" ///
			4 "Luanshya" 5 "Ndola" 6 "Lundabingo" ///
			7 "Chongwe" 8 "Lusaka" 9 "Rufunsa"
		label values district district
		tab district
			
			* 3.6.1
			//	Drop the current label for district 
			
			* 3.6.2
			//	Change 6 from "Lundabingo" to "Kitwe"
			
		
		
		
		*	3.7 creates a random variable
		generate random_variable = .
			 replace random_variable = runiform(0,0.70) ///
				if province == 1
			replace random_variable = runiform(0.25,0.90) ///
				if province == 2
			replace random_variable = runiform(0.5,1) ///
				if province == 3
			
			* 3.7.1
			//	what is the data type for the variable random_variable?
			
			
			* 3.7.2
			//	generate a column named random_percent
			//	by multiplying the random_variable by 100
			
			
			* 3.7.3
			//	rename the variable as student_scores
			
			
			* 3.7.4
			//	summarize and report the mean (or average) 
			//	of the student_scores variable
			
			
			* 3.7.5
			//	describe student_scores to see the format for the data 
			//	storage type: what is the data storage type?
			
			
			* 3.7.6
			//	browse to see the format of the student_scores variable
			
			
			* 3.7.7
			//	recast student_scores from float to integer
			
			
			* 3.7.8
			// describe student_scores to check the data storage type
			//	browse to see the changes
			
			
			* 3.7.9
			//	Find the mean or average score for females
			
			
			* 3.7.10
			//	Find the mean or average score for males
			
		
		
		
		*	3.8	creates a variable called lunch_pocket_money
			
			//	Pocket money is randomly assigned
		generate lunch_pocket_money = .
		replace lunch_pocket_money = runiformint(5,25)	///
			if province == 1
		replace lunch_pocket_money = runiformint(5,100)	///
			if province == 2
		replace lunch_pocket_money = runiformint(40,80)	///
			if province == 3
			
			* 3.8.1
			//	Which province has the highest average pocket money
			
			
			* 3.8.2
			//	Which class has the highest pocket money
			
			
			* 3.8.3
			//	Which district has the lowest average pocket money
			
			
			* 3.8.4
			//	Which province had the largest number of students 
			//	that scored 0% or simply got 0. 
			
			
			* 3.8.5
			// sort the data by student_scores and province
			
			
			
		*	3.9	creates a variable called distance_kms	
		
		generate distance_kms = .
		replace distance_kms = runiformint(10,110)	///
			if province == 1
		replace distance_kms = runiformint(5,70)	///
			if province == 2
		replace distance_kms = runiformint(1,10)	///
			if province == 3
			
			* 3.9.1
			// Which province has students that travel the longest
			// to school on average?
			
			
			* 3.9.2
			//	What kind of correlation is there between student_scores and distance_kms to school?
			
			
			* 3.9.3
			//	What kind of correlation is there between student_scores and lunch_pocket_money to school?
			
			
			* 3.9.4
			//	What kind of correlation is there between lunch_pocket_money and distance_kms to school?
			
			
			
			
*	SECTION [4]		Save the data
			
			*4.1.1
			//	Save the data in the data folder we created in 2.5
			// 	save it as simulated_edu_data_post_analysis
			
			