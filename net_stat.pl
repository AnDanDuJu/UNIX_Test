#!/usr/bin/perl

if(@ARGV==0||@ARGV>3)
{
 die "Error - Incorrect argument number!";
 exit;
}

if(@ARGV==2)
{
open (INFILE,"$ARGV[1]") or die "Error - Cannot open the file";
}

if(@ARGV==3)
{
open (INFILE,"$ARGV[2]") or die "Error - Cannot open the file";
}

if($ARGV[0] eq "-n")
{
    while(<INFILE>)
    {
	$count++;
    }
    if($count==1)
	{
		print "No interfaces present\n";
		exit;
	}
	print "Interface:\n";
    open(INFILE,"$ARGV[1]");
    while(<INFILE>)
    {
     @array=split(/\s+/);
     if($array[0]=~m/Interface/)
     {
	next;
     }
     else
     {
	print "$array[0]\n";
     }
    }
}
elsif($ARGV[0] eq "-r")
{ 
  $count=0;
  while(<INFILE>)
  {
    @array=split(/\s+/);
    if($array[0]=~m/Interface/)
    {
	next;
    }
    else
    {
	$temp=($array[1]+$array[2]+$array[3]+$temp);
    }
    $count++;
  }
  if($count==0)
  {
    $temp=0;
  }
  print "Total number of units received: $temp\n";
}
elsif($ARGV[0] eq "-t")
{	$temp=0;
	$count=0;
	while(<INFILE>)
	{	@array=split/\s+/;
		if($array[0]=~m/Interface/)
		{
			next;
		}
		else
		{
			$temp=$array[4]+$array[5]+$array[6]+$temp;
			$count++;
		}
	}
	if($count==0)
	{
		$temp=0;
	}
	print "Total number of units transmitted: $temp\n";
}
elsif($ARGV[0] eq "-v")
{
	print "Name:       Pengjian\n";
	print "Surname:    Zhang\n";
	print "Student ID: 11854801\n";
	print "Date:       8 June 2017\n";
}
elsif($ARGV[0] eq "-i")
{
 $count=0;
 print "Interface $ARGV[1]:\n";
 while(<INFILE>)	
 {
  @array=split/\s+/;
  if($ARGV[1] eq "$array[0]")
  {
   $count++;
   $temp=$array[1]+$array[2]+$array[3];
   print "Total number of units received: $temp\n";
   $percentR=(($array[1]*100)/$temp)."%";
   print "Percentage of correctly received units: $percentR\n";
   $temp=$array[4]+$array[5]+$array[6];
   print "Total number of units transmitted: $temp\n";
   $percentT=($array[4]*100)/$temp."%";
   print "Percentage of correctly transmitted units: $percentT\n";
   if($percentR<99|$percentT<99)
   {
    print "Attention: significant errors over this interface\n"
   }
  }
 }
 if($count==0)
 {
  print "Interface $ARGV[1] not found\n";
 }
}
else
{
	print "Error - Expecting option \"-n -r -t -i -v\"\n";
}

