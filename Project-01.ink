/*
    Project 01
    
    Requirements (for 15 base points)
    ! Create an interactive fiction story with at least 8 knots 
    ! Create at least one major choice that the player can make
    ! Reflect that choice back to the player
    ! Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
   * [+2] Include more than eight passages
   * [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
   *[+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
   *[+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR aura = 5
VAR bills = 0
VAR favmeal = "" 



-> side_road

== side_road == 
{You wake up to find yourself on the side of a busy road. Cars are speeding past without a care in the world. You need to find a way to cross the road without being hit by one.|There are cars speeding past you. Lots of different car colors and you need to cross the road. It's an somewhat large road to you at least.} {not getrichfast: On the right of you, there is a $100 dollar bill.} 

You have {bills} bills. {not getrichfast: Maybe you should pick up that $100 dollar bill. It's good to have something.} {getrichfast: Now you have some luck. Maybe or maybe you're just not broke anymore.} 

+ [walk alongside the road] -> alongside
+ [walk into busy traffic] -> walk
* [Pick up the $100 bill] -> getrichfast


== alongside ==
{You begin to walk alongside the road. A red car stops right in front of you. The driver lowers their window to look at you. They seem to be debating if you're worth taking or not. | A new driver seems to have pulled up and are debating to pick you up like last time. } {getrichfast: Maybe the bill you picked up ealier would help.} {not getrichfast: You don't have anything that seems worth helping you. Maybe get some money or something.}  
* {bills > 0} [bargin with $100 bill] -> bargining
+ [To the start] -> side_road
-> END

== walk == 
{You begin to walk on the road. Your feet are near the end of the road so you can head back quickly onto the dirt if you want to. | Back on the edge of the road. The cars are still pretty busy and don't seem to stop} {not shinypick: In the middle of the road there is a shiny ring.} 

+ [To the start] -> side_road
* [pick up ring] -> shinypick
+ [continue walking] -> middle
-> END

=== getrichfast ===
~ bills = bills + 1
You pick up the the $100 bill. It seems pretty lucky. 
* [Back to the start] -> side_road
-> END

== bargining ==
The driver opens the car door and picks you up. You are thrown into the backseat. Turns out the driver wants to turn you into fried chicken and with the $100 dollar bill it was even more tempting. You have to get out of this somehow. Choose carefully. 
* {shinypick} [show them the ring] -> acceptance 
+ [Cluck and flap around to get the driver to stop] -> anger 
+ [Stall for time] -> time 
-> END

== shinypick == 
You barely manage to pick up the ring in the middle of the road. It was risky but you store the ring in your feathers. Maybe it could be useful later down the road.
* [To the start] -> side_road
-> END 

== acceptance == 
The driver starts sobbing and talks about how it's similar to the ring his mother had. The driver no longer wants to turn you into fried chicken. You are let go and live the rest of your chicken years in peace.  The ring seemed more luckier than the bill you picked up. 
-> END

== anger == 
The driver seems annoyed by how big of a mess you're making in the car. As you cluck and screech to be let out you make the driver's ears hurt. The driver seems even more determained to cook you. Unfortunaly, you are instead cooked as chicken pot pie with a burnt crust. 
-> END

== time == 

You decided to try to stall for time. Something to give you more time to get out of the car. You decide to cluck a song for the driver. The driver seems confuse and stops at a gas station. At the gas station, the driver opens the back car door and you quickly escape. You did manage to cross the road at least and you're free.
-> END

== tiktokfamous == 

{aura == 5: You try to use your experince on the road as a way to get tik tok famous. Some people recorded you and now you're rich and famous. You live the rest of your life in peace} {aura == 4: You try to become famous but instead you're turned into a meme and are constanly bugged for the rest of your life.} {aura <= 3: You try to become tik tok famous but it goes nowhere. You are talked about for a minute and then never talked about again. The only mention you get is youtube videos talking about your downfall.} 

-> END

== middle == 
{ You continue to dare to walk through traffic and walk to the end of the road. Somehow when you were walking to the middle of the road there wasn't any cars passing by. Now, there is. A car is aproaching rapidly and you need to dodge somehow. | You shake off the failed car jump and just when you recover you need to dodge another car. }

+ [jump] -> carhit
+ [crouch] -> crouchC

->END

== carhit == 
~ aura = aura - 2

{ You jump up into the air but you slam into the windsheld and you loose 1 aura point. You now have {aura} aura points. | You've decided to jump again despite last time not working well. You still get hit by a car's windsheld and now you have {aura} aura points}

+ [shake it off] -> middle
-> END


== crouchC == 
~ aura = aura + 1

You crouch and the car passes right by you. You look cool while doing it and you gain aura points. You have {aura} aura points. 

+ [get back to crossing the road] -> otherside

-> END


== otherside == 
You've made it to the other side of the road somehow. The cars are now behind you and now you are safe. You can walk away from this now or do something else I don't know. There's a nearby burger place to go if you want to. 

* [go to the burger place] -> yummy 
* [try going home and being tik tok famous] -> tiktokfamous


== yummy == 

You go inside the burger place. What's your favorite thing to get? 

* [burger] 
~ favmeal = "Burger" 

-> food

* [fries] 
~ favmeal = "Fries" 
-> food

* [chicken nuggets] 
~ favmeal = "Chicken nuggets" 
-> food

== food == 

You order {favmeal} and enjoy it on the way home. 

-> END
