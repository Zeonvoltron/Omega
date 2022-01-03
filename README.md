# Omega: What is it?
Omega is a Digital Organism. It replicates from drive to drive, and its offspring can mutate, so environmental pressure can be applied to them, and so evolution can occur. In other words, it’s like a very simple bacteria, but digital.
Its not a malicious program, but it cud evolve into one.

# What is the goal of creating Omega?
The goal is to create the most similar thing to a digital life form. This is not a simulation of life nor evolution.

# What does a program need to behave like a living thing?
There are many definitions of life, so there isn’t really a consensus about what life is, so I focused on the following characteristics:
1)	It reproduces (makes copies of itself).
2)	It has a way of storing the instructions of how it works, and how to make itself (Genetic Information), and that information is passed to the offspring.
3)	Its Genetic Information can suffer mutations, which can influence the behavior of the organism and are passed to the offspring.
4)	Environmental pressure can produce a selection of the best organisms in the task of reproducing, making the organisms change over time and adapt to changing environments     to keep reproducing, or being the best at it.
(As you can see, I’m focusing on the characteristics of life that enables it to evolve)
So, if I want a program to be “alive”, I need it to have those characteristics.
In this case Omega accomplishes those four characteristics the following way:
1)	Makes copies of itself in every drive it can reach.
2)	Stores its Genetic Information in the way of binary code (the one that codifies the executables that constitute the organism).
3)	It makes random changes to the bytes that codifies its offspring with a certain probability.
4)	The user of the computer, antivirus, drives and the computer itself are the environment on which Omega has to survive and reproduce, they apply pressure, and they change with time, forcing Omega to adapt and evolve.
But apart of all that, if I want this organism to really evolve in the freest way possible, I need it to propagate without the user’s knowledge, because I don’t think many people would want a living organism to be in their computer.

# How does Omega work? (In a nutshell)
Omega as an organism consist of three individual executables (Omega.exe, alpha.exe and delta.exe) and an ico file (the ico of a default folder). The part of Omega that behaves like a Digital Organism is Omega.exe, the other two executables just help Omega.exe to work.
Omega.exe is an algorithm that searches for drives with enough free space to copy itself to it. Once it finds them it copies the Omega folder with all its contents to the drive and hides the folder, then makes a hidden folder called “SafeFiles” and moves to it every child item of the drive (except those that are hidden). Then makes a shortcut called “Safefiles” (with the SafeFiles ico, a folder ico) that targets delta.exe (the one that is in that drive).
Delta.exe is a very simple program that opens the SafeFiles folder and starts Omega.exe (the one that is in the same Omega folder). This way, when that drive is opened in another computer and the user double clicks SafeFiles.lnk, he can access the files of the drive normally, but simultaneously, without knowing, the Omega.exe of the drive copies the omega folder with its content to de local drive of the computer and starts the Omega.exe of that drive, so Omega is installed in that computer, and the Omega.exe of the drive shuts itself down.
Once this new Omega.exe is started in this new computer, apart of searching for drives to copy itself like I explained before, it moves every folder on the desktop to a hidden folder in the local drive and leaves shortcuts in the desktop with the same name of the folders it moved and the SafeFiles ico. Each one of these shortcuts targets an alpha.exe, which when executed, opens the file with the shortcuts name and executes silently the Omega.exe in the local drive. This way, every time the user wants to access a given folder of his desktop, he can do it normally, but without knowing, he also activates Omega, which remains active, looking for drives to copy itself until the computer is shut down. When the computer is turned on again, Omega.exe is not running, but when the user enters one of his desktop “folders”, Omega.exe will be activated again and the cycle repeats.
Apart of all that, every time Omega.exe copies the omega folder to another drive, there is a small probability that it also mutates everything inside the Omega folder it just copied.

# Developers:
Omega was developed by Lorenzo Vittone in collaboration with Gregorio Vittone.
Disclaimer: none of us is a real programmer, we learned the basics of PowerShell in less than a month just to make Omega, so you might see a lot of nonprofessional code in the scripts. Github and other programing webpages where of big help to make Omega.

# How to install Omega?
To install Omega, just download the Omega file available in the “view code” section and move it to C: \, once there double click the Omega.exe that is inside the folder, and its done. You should see how your desktop folders are replaced one by one by a shortcut with the same name of the folder.
Alternatively, you cud download the PowerShell scrips to edit them, compile them, and then do the installation with those files. The compiled files uploaded were created using PS2EXE compiler with the arguments -NoOutput, -NoError and -noVisualStyles.
Warning: Omega can change its own bytes, any malfunction cud harm your files. Act on your own risk! We are not responsible of anything that Omega might do if you release it.

# Unresolved Issues:
The idea is Omega to be undetectable and completely silent, but unfortunately, every time one of the executables is opened, it displays a window, so the user can tell something is off. Aldo I managed to make the window close almost instantly, it can still be seen.

# Future Upgrades:
Omega can upgrade by itself, but very slowly, and I’m sure it cud be much better and efficient, so I will probably upload some upgraded versions in the future. Some upgrades might be little, changing some details, but I also have some big changes in mind, almost like an Omega2.
Either way, by publishing the code I hope other people can make their own Omega upgrades/versions. At the end the fittest will thrive.

