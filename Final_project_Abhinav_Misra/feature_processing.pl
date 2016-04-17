#!/usr/bin/perl -w

use strict;
use warnings;

my $arg1=$ARGV[0];
my $arg2=$ARGV[1];
my $arg3=$ARGV[2];
my $arg4=$ARGV[3];

`sed 's/ //g' $arg1 > tmp.txt`;   # converting single space characters to null space so that names of countries like West Indies , South Africa etc. becomes one word instead of two



open( file, "tmp.txt") or die $!; 
my @filecontents = <file>;
open( file2, $arg2) or die $!;
my @file2contents = <file2>;
open( file3, $arg3) or die $!;
my @file3contents = <file3>;
open( file4, $arg4) or die $!;
my @file4contents = <file4>;
my @map_feat;
my $i;
my $result;
my $country_val;
my $type_of_win;
my $home_turf;
my $country_winning_percentage;
my $india_winning_percentage=50.12;

for ($i=0; $i<$#filecontents; $i++)
   {
     my $fileval=$filecontents[$i];
        $fileval=~ m/((\S+)\s+(\S+)\s+(\S+)\s+\d+(\S+)\s+(\S+)\s+\S+)/;
        my $line =$1;
	my $team1=$2;
        my $team2=$3;
        my $wining_team=$4;
        my $margin_of_win=$5;
        my $place=$6;
        if ($team1 ne "India" ) 
           {
		my @match=grep{/$team1/}@file2contents;
                my $match_val=$match[0];
	        $match_val=~m/(\S+\s+(\d+))/;
	  	$country_val=$2;
 		my @match_again=grep{/$team1/}@file4contents;
		my $match_again_val=$match_again[0];
		$match_again_val=~m/(\S+\s+(\d+\.\d+))/;
		$country_winning_percentage=$2;
           }else
           {
		my @match=grep{/$team2/}@file2contents;
                my $match_val=$match[0];
                $match_val=~m/(\S+\s+(\d+))/;
                $country_val=$2;
		my @match_again=grep{/$team1/}@file4contents;
                my $match_again_val=$match_again[0];
                $match_again_val=~m/(\S+\s+(\d+\.\d+))/;
                $country_winning_percentage=$2;

	   }
   	if ($margin_of_win eq "wickets")
           {
		 $type_of_win = 0;

	   }else
           {
		 $type_of_win=1;
	   }
        
        if ( grep( /$place/, @file3contents ) )
           {
		 $home_turf=1;
           }else
           {
		 $home_turf=0;
           }
        
	if ($wining_team ne "India")
           {
		 $result=0;

          }else
          {
		 $result=1;
	  }	
	
	my $log5=($india_winning_percentage-($india_winning_percentage*$country_winning_percentage))/($india_winning_percentage + $country_winning_percentage -2*$country_winning_percentage*$india_winning_percentage);		# calculating log5 sabarmetric
	print "$result 1:$country_val 2:$type_of_win 3:$home_turf 4:$log5\n";
   }











