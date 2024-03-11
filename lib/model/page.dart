import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'description.dart';
import 'news_itm.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
        title:
            'Volkswagen Has Made A Car For Farmers, And No, It\'s Not A Truck',
        text:
            'The Volkswagen Polo will be turning 50 next year, plenty of time for the small car to take many forms. Since its launch in 1975, it\'s been sold as a hatchback, sedan, wagon, and even as a crossover – remember the Polo Cross? This year, the company\'s Brazilian division is revisiting the idea of a more rugged version with a raised suspension.Called the Polo Robust, the new flavor of the supermini has been engineered specifically for farmers. VW Brazil claims the new crossover-esque derivative has been "developed and tested with customers in the agricultural segment" in mind. Since it has to tackle rougher roads, the hatchback on stilts has better ground clearance. Think Dacia Sandero Stepway. There\'s more to the Polo Robust than its lifted suspension since VW Brazil is also giving it vinyl seats. It\'s the easiest type of upholstery to clean after a hard day of work at the farm. In addition, you also get rubber floor mats and even a trailer hitch. However, owners won\'t be able to tow heavy loads since the workhorse is powered by a naturally aspirated 1.0-liter gasoline engine. It only makes 84 horsepower and 101 Newton-meters (75 pound-feet) of torque routed to the front wheels via a five-speed manual gearbox.',
        image:
            'https://cdn.motor1.com/images/mgl/ZnynQ3/s1/volkswagen-polo-robust-2025.jpg',
        date: '6 march, 2024'),
    NewsItem(
        title:
            'Hyundai Thinks Hybrids Could Save Fun Cars With Gasoline Engines',
        text:
            'Biermann said the Elantra N (aka i30 Sedan N) "could be an option – technically it\'s in there." He refrained from confirming whether the performance sedan will be electrified but admitted it\'s technically possible. Let\'s keep in mind that Hyundai has already confirmed a next-generation model with a gasoline engine, suggesting it might even get a bigger ICE.  The turbocharged 2.5-liter unit would be a nice bump over the existing 2.0-liter engine. In its current form, the Elantra N has 276 horsepower whereas the larger engine is rated at 290 hp in the Sonata N Line and as much as 300 hp in the Genesis G70. Of course, adding an electric motor would increase the output even more. If approved, it might not be the only hybrid N car from Hyundai as Biermann says he is trying to convince the higher-ups to green-light a smaller electrified N. However, the project is still in its infancy. Hyundai is already looking ahead, having just launched the fully electric Ioniq 5 N crossover. There are also reports of an Ioniq 6 N sedan, potentially with even more power. Biermann explained the Korean automaker wants to cover all the bases by catering to different tastes while meeting ever-changing regulations. The ex-BMW M boss argued that a hybrid powertrain would bridge the gap between performance cars with pure combustion engine cars and full EVs.',
        image:
            'https://cdn.motor1.com/images/mgl/7ZvrKA/s1/2024-hyundai-elantra-n.jpg',
        date: '6 march, 2024'),
    NewsItem(
        title:
            'Volkswagen Sued Twice As Felicity Ace Cargo Ship Fire Might Have Started From A Porsche',
        text:
            'In February 2022, the Felicity Ace cargo ship caught fire and ultimately sank, ending on the bottom of the Atlantic Ocean. Some 4,000 cars perished in the fiery incident, most of which were brand new vehicles from various Volkswagen Group brands. The drama is not over yet for the automotive conglomerate since the German juggernaut is facing not one but two lawsuits. Bloomberg reports the VW Group has been sued twice over allegations the fire started from a lithium-ion battery pack inside a Porsche that was on its way to a customer. Felicity Ace caught fire near the Azores archipelago while carrying an estimated \$155 million worth of high-end cars, including 1,110 Porsches. Plaintiffs claim one of those cars sparked the fire that subsequently generated a veritable cartastrophy. One of the lawsuits was filed in a court in Stuttgart where Porsche calls home. The lawsuit is led by the cargo ship\'s operator, Mitsui OSK Lines, and Felicity Ace\'s insurer, Allianz. Interestingly, this lawsuit was filed over a year ago, but its progression has been halted due to mediation talks for a second lawsuit in a Brunswick court, located in Lower Saxony, Germany. Additional discussions between the involved parties are scheduled for later this month. If a settlement is not reached, the lawsuits will resume. According to documents related to the initial 2023 lawsuit, the plaintiffs accuse VW of withholding information about the risks associated with transporting electrified cars. Moreover, the lawsuit filed in the Stuttgart court alleges that VW failed to disclose the necessary precautions for safely transporting the cars.',
        image: 'https://cdn.motor1.com/images/mgl/BXOboR/s1/felicity-ace.webp',
        date: '6 march, 2024'),
    NewsItem(
        title:
            'Dodge Can’t Decide On A Sound For The Charger Daytona\'s Fratzonic Exhaust',
        text:
            'The new Dodge Charger Daytona is here. It\'s 100 percent electric but it\'s by no means a quiet car. It uses what Dodge calls a Fratzonic Chambered Exhaust system to give the Charger a muscle car rumble. But what exactly does that mean? And more importantly, what does it sound like? The Charger Daytonas presented to media during Dodge\'s press event were kept silent, and while the official launch video includes some sound clips, they aren\'t representative of the final product. That\'s because Dodge is still trying to decide exactly what its new electric Charger should sound like. That\'s where the Fratzonic Chambered Exhaust comes in. Obviously it involves speakers, as electric motors don\'t make combustion-engine noises. But the speakers are installed in an exhaust-like chamber specifically designed to make noise, or more specifically, shape it. The exact design of the chamber is something Dodge hasn\'t shared. But the combination of speakers and the chamber will give the Charger Daytona a slice of old-school Detroit V-8 attitude. Or at least, that\'s what Dodge is hoping for.',
        image:
            'https://cdn.motor1.com/images/mgl/Qe3eG3/s1/2024-dodge-charger-daytona.jpg',
        date: '5 march, 2024'),
    NewsItem(
        title: 'Porsche Recalls 911 For Windshelds That Can Detach In A Crash',
        text:
            'Porsche has recalled over 8,000 911s because the front and rear glass windshields could detach in a crash. Per the National Highway Traffic Safety Administration (NHTSA), 8,101 Porsche 911s from 2020 through 2024 are potentially affected, though the documents don\'t specify which trims are involved. The problem lies with the adhesive used to bond windshields and rear windows to the cars, or rather, the circumstances in which it was used. It seems some 911s didn\'t have surfaces completely clear of residue at the time of installation at the factory. This can result in a weaker adhesive bond. Porsche learned about the issue last November through "optically impaired windows in the field." An inspection found that the glass could become partially detached in these weaker areas. Should a crash occur, the overall bond could be too weak to hold the windshield in place. We probably don\'t need to say this, but generally speaking, flying glass isn\'t a good thing.',
        image:
            'https://cdn.motor1.com/images/mgl/9Yxy0/s1/2022-porsche-911-gts-coupe-exterior.jpg',
        date: '5 march, 2024'),
    NewsItem(
        title: 'The Dodge Charger Daytona Weighs As Much As A Kia EV9',
        text:
            'Electric cars are heavy. This isn\'t much of a surprise. What is surprising is that the new Dodge Charger Daytona EV weighs 5,838 pounds, which is much as a long-range all-wheel drive Kia EV9, a three-row electric crossover. The base EV9, with smaller battery and single motor at the rear, weighs just over 5,000 pounds. Kia quotes between 5,800 and 5,886 pounds for the fully loaded EV9 GT-Line model depending on equipment. So the Charger Daytona in both R/T and Scat Pack trims weigh as much a fully decked-out SUV that has seating for six to seven. Needless to say, the Charger Daytona does not accommodate so many passengers. While the old internal-combustion only Dodge Charger was a large car, the new Charger Daytona is even bigger. The new Charger Daytona Scat Pack is slightly larger in wheelbase, width and height than the old Charger Scat Pack Widebody, and notably, 5.5 inches longer overall. Its predecessor wasn\'t a light car at 4,361 pounds, but the addition of a big 100.5-kWh net (93.9-kWh usable) battery pack and electric motors front and back have upped weight significantly. The Charger Daytona EV also uses the same basic platform, STLA Large, as the upcoming six-cylinder Charger, and the need to accommodate both powertrain types may have pushed up weight further.',
        image:
            'https://cdn.motor1.com/images/mgl/P3036L/s1/2024-dodge-charger-next-to-kia-ev9-suv.webp',
        date: '5 march, 2024'),
    NewsItem(
        title: 'The Nissan Ariya Is Way Cheaper For 2024',
        text:
            'Nissan is slashing prices for its all-electric Ariya crossover. The SUV is, at minimum, \$3,575 cheaper for the 2024 model year. The big news comes further up the Ariya line, where most trims are nearly \$6,000 cheaper than before. The 2024 Nissan Ariya starts at \$39,590. That gets you an Engage trim car powering just the front wheels with a 63-kilowatt-hour battery pack. That trim and its all-wheel drive equivalent are nearly \$3,600 cheaper than before. Every other trim is \$5,975 less expensive for 2024. They\'d be even cheaper if Nissan hadn\'t increased its destination fee slightly, from \$1,365 to \$1,390. Still, a \$25 bump doesn\'t remotely offset a near-\$6,000 drop. Here\'s a complete price breakdown of Ariya trims for 2024 and how it compares to 2023. All prices include destination fees.',
        image:
            'https://cdn.motor1.com/images/mgl/BXOzJZ/s1/2023-nissan-ariya.jpg',
        date: '5 march, 2024'),
    NewsItem(
        title:
            'Dodge Says It Doesn\'t Care About The Charger Daytona\'s Efficiency Or Range',
        text:
            'The Dodge Charger goes electric with the new Daytona model, but it is still unashamedly a muscle car. At a preview event for the Charger Daytona, Dodge head Tim Kuniskis told gathered media "I don’t care. This is about performance," when asked about range and efficiency. "Muscle car owners don’t care about fuel economy," he added. That said, the EPA range figures for the Charger Daytona are solid. The Charger Daytona R/T promises a 317-mile range from its 100.5-kWh gross (93.4-kWh net) battery pack, while the more powerful Scat Pack should do 260 miles on a full charge. Your milage may obviously vary – especially if you take advantage of the Daytona\'s donut mode – but that\'s an average figure of 3.4 miles/kWh for the R/T and 2.78 mi/kWh for the Scat Pack. Not bad for vehicles that weigh 5,838 pounds and offer 496 and 670 horsepower, respectively.',
        image:
            'https://cdn.motor1.com/images/mgl/y2G2lk/s1/2024-dodge-charger-daytona.jpg',
        date: '5 march, 2024'),
    NewsItem(
        title: 'The V-8 Dodge Charger Is Officially Dead',
        text:
            'The electric Dodge Charger Daytona is here, but it\'s not alone. The Charger\'s future includes internal combustion power, which we suspect has many of Dodge\'s so-called "brotherhood" breathing a big sigh of relief. But with that news comes confirmation that the engine under the Charger\'s hood won\'t be a V-8 – Hemi or otherwise.  We asked Dodge CEO Tim Kuniskis about the Hemi V-8 during the Charger Daytona press event. Ford isn\'t holding back these days about having a V8-powered Mustang; with EV demand diminishing and signs that government regulations may backtrack some, we wondered if there might be some pressure at Dodge to get a V-8 in the new Charger. But Kuniskis didn\'t mince words about the subject. "We don\'t have a V-8 in the plan," Kuniskis told us. There were no caveats, no hesitation. If a Hemi Charger does come back at some point, it won\'t be anytime soon. The million-dollar question now is whether die-hard Dodge buyers will accept a twin-turbocharged straight-six Charger. The new Charger Sixpack arrives in the first quarter of 2025, so named because it\'s packing the same 3.0-liter Hurricane six-cylinder engine that debuted with Jeep. The boosted mill will also power Ram 1500 trucks starting this year, and in the Charger, it develops 420 or 550 horsepower in high-output trim. That\'s not Hellcat power, but it beats every naturally aspirated Hemi Charger that came before.',
        image:
            'https://cdn.motor1.com/images/mgl/88Gv2/s1/2021-dodge-charger-hellcat-redeye-exterior-review.webp',
        date: '5 march, 2024'),
    NewsItem(
        title: 'Dodge Has No Plans For A New Challenger',
        text:
            'The Challenger nameplate has been in the Dodge lineup since the early 1970s. The most recent third-generation model went on sale in 2008 and introduced powerful iterations like Scat Pack, Hellcat, Redeye, and many more to the lineup. Now, after 16 years, the Challenger is no more—at least the name isn\'t. With the arrival of the new Charger Daytona, Dodge is discontinuing the Challenger nameplate for the foreseeable future. A Dodge spokesperson told us in an interview that there are "no future Challenger plans at this time." While that may be disappointing for fans longing for a new Challenger, the Charger EV will technically take the place of the outgoing muscle car. The Charger comes in two- and four-door configurations with classic trim options like R/T and Scat Pack carrying over. An optional Track Pack is available on the latter. In terms of size, the new Charger Daytona coupe is bigger than the Challenger it replaces with a 121.0-inch wheelbase and a total length of 206.5 inches, compared to the Challenger\'s 116.0-inch wheelbase and 197.9-inch total length. It\'s also wider than the Challenger by 8.6 inches; 84.3 inches compared to 75.7.',
        image:
            'https://cdn.motor1.com/images/mgl/L3k363/s1/2024-dodge-charger-daytona.jpg',
        date: '5 march, 2024'),
    NewsItem(
        title:
            'Dodge Charger Will Get 550-HP Hurricane Inline-Six Gas Engine In 2025',
        text:
            'The gas-powered Dodge Charger isn\'t dead yet. While the V-8 may be gone, Dodge will continue to offer the Charger will an internal combustion engine alongside the two new electric variants revealed today.  At the top of the internal combustion food chain sits the Dodge Charger Sixpack H.O. It\'s powered by Stellantis\'s 3.0-liter twin-turbo Hurricane straight-six engine, rated at 550 horsepower. There\'s also a Sixpack S.O. version rated at 420 horsepower. "The Hurricane engine-powered Dodge Charger Sixpack models will give the Brotherhood of Muscle a gas option that produces better horsepower and torque numbers than the outgoing 5.7 and 6.4-liter HEMI engines," said CEO Tim Kuniskis. By the time production ended, the 5.7-liter and 6.4-liter naturally aspirated V-8s available in the Charger made 370 hp and 485 hp, respectively. ',
        image:
            'https://cdn.motor1.com/images/mgl/W8M8KN/s1/2024-dodge-charger-daytona.jpg',
        date: '5 march, 2024'),
    NewsItem(
        title: '2024 Dodge Charger Daytona EV: This Is It',
        text:
            'The next-generation Dodge Charger is here, and the rumors were true. Electric and combustion-powered Chargers will coexist going forward. Electric models are all Charger Daytonas, while gas Chargers get "Sixpack" branding. But Dodge doesn\'t want buyers to see electric or gas cars here. In the eyes of Dodge CEO Tim Kuniskis, the new Charger is a muscle car regardless of how the power is made. He makes a compelling case. When 2024 Dodge Charger Daytona production begins this year, the least powerful version will have up to 496 horsepower. There\'s also a 670-hp version, each sending power to all four wheels. The ICE Charger is also AWD, entering production next year with 420 hp or 550 hp. At launch, the fastest Charger Daytona reaches 60 mph in 3.3 seconds and goes 11.5 seconds in the quarter-mile. Dodge claims the new Charger Daytona is the quickest and most powerful muscle car in the world — barring the bonkers 800-volt Banshee that comes next year. ',
        image:
            'https://cdn.motor1.com/images/mgl/1ZKZwW/s4/2024-dodge-charger-daytona.webp',
        date: '5 march, 2024'),
    NewsItem(
        title:
            'The New Aston Martin Vantage F1 Safety Car Has Many Buttons And Screens',
        text:
            'The old Vantage Formula 1 Safety Car was as slow as a turtle, according to reigning champion Max Verstappen. Aston Martin is now addressing the lack of pace with the next-generation model that gets a massive boost in output of 153 hp for a grand total of 656 hp. We\'ll see it this coming weekend at the 2024 Saudi Arabian Grand Prix where it\'ll be joined by the DBX707 F1 Medical Car. Compared to the road-going Vantage introduced last month, the bespoke version in F1 role has a prominent front splitter and a chunky rear wing. These items are all part of a more comprehensive aerodynamic kit that also includes a modified underfloor for better air flow. Interestingly, even the light bar mounted on the roof has been reshaped for better aero. The cabin has been subjected to more than a few changes as well. For example, the standard seats have made way for a pair of Recaro Pole Position bucket seats with a racing harness for driver Bernd Mayländer and his passenger. Aston Martin tweaked the center console to accommodate a plethora of buttons for the switchgear hooked up to the mandatory FIA systems. There are also a couple of screens on the passenger side that show where all cars are positioned on the track, along with live lap times, and a rearview camera feed. The Lime Essence trim used throughout the cabin is exclusive to the Vantage F1 Safety Car and is a nod to Aston Martin\'s striking livery in Racing Green.',
        image:
            'https://cdn.motor1.com/images/mgl/NGeGL9/s1/2024-aston-martin-vantage-f1-safety-car.jpg',
        date: '5 march, 2024'),
    NewsItem(
        title:
            'Automakers Risk Lower Safety Ratings If They Don\'t Bring Back Buttons',
        text:
            'The proliferation of huge in-car screens has been done at the expense of old-school buttons. However, physical controls might make a comeback if automakers want to earn maximum safety ratings from Euro NCAP for their cars. New rules slated to come into effect in January 2026 will deduct points from vehicles that don\'t have certain traditional controls. The European New Car Assessment Programme intends to downgrade the safety ratings of newly tested cars that don\'t have buttons, stalks, or dials for the following functions: turn signals, hazard lights, horn, windscreen wipers, and emergency call. The latter is known as the eCall function and has been mandatory in the European Union for several years. It automatically dials the local emergency number in the event of a serious car accident. But not all automakers are slapping iPads on their dashboards and calling it a day. Hyundai is putting more traditional controls into their cars and other brands such as Toyota haven\'t really abandoned the straightforward layout of shortcuts on the dashboard. Skoda has found what may be the perfect compromise with three physical dials with built-in customizable screens, allowing you to tweak settings using the same dials.',
        image:
            'https://cdn.motor1.com/images/mgl/BXNWXZ/s6/2024-skoda-superb.webp',
        date: '5 march, 2024'),
    NewsItem(
        title: 'The 2024 Tesla Cybertruck Isn\'t The Revolution We Expected',
        text:
            'From the outside, the Tesla Cybertruck is innovation incarnate. It is a form-shifting, rule-breaking rejection of everything internal-combustion automakers have told you a pickup truck should be. It promises a new world, an unbounded horizon, a fundamental shift. On the inside, it is a Tesla, a recognizable evolution from the 2013 Model S. And from the driver’s seat, it’s an electric pickup, like all of the others on sale. It is Tesla’s most revolutionary-looking product and simultaneously its least disruptive to date. It is competitive, not dominant. It does not punt the ball down the field, it inches it forward. And its defining feature isn’t any particular spec or feature. It is the unfathomable, oppressive amount of attention it gets. If that’s what you want, you can’t beat the Tesla Cybertruck. The rest is about on par with the Rivian R1T, a truck that’s been on sale for years, offers a lower entrance price, and more fleshed-out off-roading features.',
        image:
            'https://cdn.motor1.com/images/mgl/P303XK/s1/tesla-cybertruck-review.jpg',
        date: '4 march, 2024'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 65, 16, 26),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: Color(0xFF0075FF),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFF0075FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'News',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 32,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [getNews()],
            )),
          ),
        ],
      ),
    );
  }

  Widget getNews() {
    List<Widget> list = [];
    for (var news in newsList) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DescriptionNewsPage(
                      news: news,
                    )),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFFD6D6D8)))),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                    news.image,
                  ))),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              news.title,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  height: 1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        news.date,
                        style: const TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Text(
                    news.text,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )
          ]),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }
}
