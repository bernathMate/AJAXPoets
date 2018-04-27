/*
    Database initialization script that runs on every web-application redeployment.
*/
DROP TABLE IF EXISTS works;
DROP TABLE IF EXISTS poets;

CREATE TABLE poets (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE works (
    id SERIAL PRIMARY KEY,
    poet_id INTEGER,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    published_date INTEGER NOT NULL,
    FOREIGN KEY (poet_id) REFERENCES poets(id)
);

INSERT INTO poets(id, name, email, password) VALUES
    (1, 'Závada Péter', 'zavada.peter@poets.hu', 'peter'),
    (2, 'Babits Mihály', 'babits.mihaly@poets.hu', 'mihaly'),
    (3, 'Kosztolányi Dezső', 'kosztolanyi.dezso@poets.hu', 'dezso'),
    (4, 'Csáth Géza', 'csath.geza@poets.hu', 'geza');

INSERT INTO works(id, poet_id, title, content, published_date) VALUES
    (1,
    1,
    'Remíz',
    'Nem tudom elfogadni, hogy lassan
    véget ér ez a nyár is, és aztán már
    nem lehet változtatni rajta. Az képtelenség,
    hogy mától az elöl felejtett tej vagy
    a számban a fogak egy új időszámítás
    szerint romlanak. Legalább át kéne
    csempészni magamból valamennyit
    ebbe az új korszakba, hogy ezután is legyenek
    a múltammal kapcsolódási pontjaim.
    Csak vigyázni kell, nehogy lebukjak:
    a szemeim vörösek és be vannak
    dagadva, persze, hagymát vágtam,
    vagy úszni voltam, és kicsípte őket a klór.
    Két hete nem láttalak, és amióta
    másnál alszol, már csak a forró laptop
    hagy vörös égésnyomokat a mellkasomon.
    Mi lesz, ha a legelején félbeszakad
    ez a gondolatfonál, és sehogy se
    jut eszembe, hogy kéne folytatni?
    De azt se lehet, hogy folyton írom,
    amit gondolok, az utcán, mondjuk
    a telefonomba, biztos elütne egy villamos,
    és akkor már mindegy volna. Átható
    fűszaga van ennek a hétfőnek. Biztos
    kenderolajjal kenik az alkatrészeit.
    A jövő ott van valahol a szerelvény
    csuklóján túl, puha, sötét kanyar: beláthatatlan.
    De lassan úgyis vége, kivonják a forgalomból
    ezeket a rozsdás napokat is, én pedig
    egyedül ébredek majd a remízben,
    sötétedés után, mert úszásból jövet
    elaludtam a leghátsó ülésen, és senki
    nem szólt időben, hogy le kéne szállni.',
    2015),
    (2,
    1,
    'Testtáj',
    'Ezt a két partot már csak a szélcsatornák
    kötik össze, egyébként napról napra
    távolodnának. Miközben átvágunk az utolsó
    épségben maradt hídon, lépteink szorosan
    egymáshoz simulnak. Nem tudom,
    mit kezdjünk egy ilyen tárgytalan pontossággal,
    de biztos létezik valami, aminek te vagy
    a legprecízebb mérőműszere. Lépéseiddel
    úgy találod el az atomok rezgésszámát,
    hogy a hullámok az acélszerkezetben is
    láthatóvá válnak. Hallod? Ilyen a beálló csönd
    egy életvidám város véghangsúlya után.
    A tragikus hirtelenséggel véget érő utcákat
    tanulod meg a legnehezebben. Általában
    sötétben jutsz az eszembe, alig tudom kivenni
    a vonásaidat. Ilyenkor elképzelem, ahogy
    kiékeled magad egy megfelelő hosszúságú
    fintorral két arckifejezés pillére közé.',
    2015),
    (3,
    2,
    'Pesti éj',
    'Én így szeretem ezt, spaléta nélkül,
    mikor keresztet vet reám az ablak
    keresztlécével, és a hold bekékül
    szobámba, jaj! hogy éjről-éjre kapjak
    a bús Mosáshoz, mely lelkemben öblög,
    titkos kékítőt. Óh be mar a lug!
    Tiszta éj vize, töltsd szinig a csöbröt,
    és szent alázat, oldj belé hamut! -
    Kutyám halódik és állati kínja
    hörgését csurrogatva reves éltem
    teknejébe, olyan a hangja, mint a
    vízvezetéké, mely csepeg az éjben.
    Óh kínok cseppje, mely követ kivájna!
    Vigasztalan sötétség! állati
    egyedülség! ha elég mélyre fájna
    belém keserved, talán mint aki
    erős szöggel szögezve egy keresztre,
    úgy csüggnék Isten eleven keresztjén,
    amelyre minden élet rászögezve
    kínjaik föloldódnak a keresztény
    »lelkek-egyességében«. Drága oldás,
    hol kín a kínnak titkos orvosa,
    mert eggyé, mint a kereket a forgás,
    olvasztja mind a szívek ritmusa,
    mely az Élet ritmusa. Minden bűnöm
    oldódjon az Életbe! Hulljon, hulljon
    kereszt ágyamra, lúg szívemre! Szűnjön
    külön életem kicsi kínja! Múljon
    a Minden-Élő kínjaiba! Csöpp lesz
    melyet az Úr szent tengere lep el...
    Fű... ember... állat...
    S a Halál se több lesz,
    mint két ing közt egy meztelen kebel.',
    1924),
    (4,
    2,
    'Dzsungel-idill',
    'Jer ki, kedves, az esőtől minden ujra friss.
    Láttad hogy kinyilt a másik georgina is?
    Ne nevess! Csak pár szál virág tipeg körülünk:
    de legalább mindeniknek külön örülünk.

    Hajdan erdőségbe vágytam, milliónyi vén
    góliát fa sürüjébe, kicsi Dávid én.
    Érzéssel fujtam tanitóm csitri dallamát:
    «Árnyas erdőben szeretnék élni nyáron át!»

    De ma lásd, oly rémes erdő zaját hallgatom,
    s ennen életem mögöttem olyan vak vadon!
    Éjjel is magába húz egy ingó sűrüség,
    hol az ijedt álom jár és zsámbékokra lép.

    Jer hát, jó itt csöpp kertünkben, mely ma ujra friss!
    Örülj hogy kinyilt a «másik» georgina is.
    Nékem ez a pár fa-alja époly dús világ,
    mint a legnagyobb erdőség, «élni nyáron át».

    Fű között szemem ha lát egy pöttöm bogarat,
    vele megy veszélyes utján, dzsungele alatt,
    s tudja, mily tér egyik diófától másikig,
    hol ezer csoda burjánzik, ezer rém lakik.

    Sohsem ér a kert végébe. Elég messzeség
    elérni a ránkboruló levelek közé,
    amik olyan illatosak és keserüek,
    mint e nyár, melyet alattuk élni jó veled.',
    1931),
    (5,
    3,
    'Üllői-úti fák',
    'Az ég legyen tivéletek,
     Üllői-úti fák.
    Borítsa lombos fejetek
    szagos, virágos fergeteg,
         ezer fehér virág.
    Ti adtatok kedvet, tusát,
    ti voltatok az ifjuság,
         Üllői-úti fák.

    Másoknak is így nyíljatok,
         Üllői-úti fák.
    Szívják az édes illatot,
    a balzsamost, az altatót
         az est óráin át.
    Ne lássák a bú ciprusát,
    higgyék, örök az ifjuság,
         Üllői-úti fák.

    Haldoklik a sárgult határ,
         Üllői-úti fák.
    Nyugszik a kedvem napja már,
    a szél busan dúdolva jár,
         s megöl minden csirát.
    Hova repül az ifjuság?
    Feleljetek, bús lombu fák,
     Üllői-úti fák.',
    1907),
    (6,
    3,
    'Méz',
    'A fájdalmam oly érett, mint a méz már,
    és bölcs és mély és terhes száz titokkal,
    és minden kincseket magába foglal,
    és hallgat és vár, sehova se néz már.
    Virágtalan bánat. De ez: a minden.
    Méz, tiszta méz, méz, mennyei ital,
    több mint a föld tünő virágival,
    ambrózia, virágok lelke, kincsem.
    Gyümölcs, nektár, melytől üdül a hívő,
    minden cukrot magába édesítő.
    Én csak röpültem és ezt szüreteltem
    kalászos rónán és szőlős hegyekben,
    ezt szüreteltem, mert én csak röpültem,
    és életem nehéz mézzé köpültem,
    bánattá, jajjá, könnyé, tiszta mézzé,
    egy csonk világban egy fájó egésszé.
    Ó lankák, ó virágok messze tája,
    ti telt gyümölcsök korhadt rúdakon,
    s ó könny, te élet mély esszenciája,
    megölt virágok méze, fájdalom.',
    1912),
    (7,
    4,
    'Muzsikusok (részlet)',
    'A városban csak úgy beszéltek róluk: a muzsikusok. A nevüket senki sem tudta biztosan, összekeverték: Kulhanek, Manojlovics?! Nevettek rajtok, kicsit megvetették, és kicsit tisztelték őket. Ha vasárnap a nagymisén átzúgott a templomon a trombiták hangja, úgy, hogy némelyik érzékeny gimnazista összeborzongott és belesápadt, ilyenkor a nép is bizonyos elismeréssel gondolt talán egy pillanatra rájuk, a muzsikusokra, akik eljöttek messze Csehországból, hogy az Úr méltó tiszteletben részesüljön olyan városban is, ahol senki, de senki se tud kottából trombitálni. De különben!? Ők maguk is jobban szerettek erről nem gondolkozni.

    Idegenül érezték magukat a városban, és ha a kicsiny kőszínházban, ahol télen át az előadásoknál zenéltek, valamelyik hazafias darabban előkerült a Rákóczi-induló, mindig értelmetlenül és bizalmatlan hunyorgással néztek föl a zenekar mélyéből a közönségre. A közönség - a 90-es évekről van szó - kivétel nélkül hangos kiabálással és lármásan tapsolt. Ezt nem lehetett megérteni. Mert elvégre ők "taktmässig" eljátszották a darabot, és nagyobb hiba se történt - ha a pozaun irgalmatlanul recsegő hangjait hibának nem számítjuk -, de mivel különb ez a darab, mint a többi!? Ilyenkor viszont ők vetették meg egy kicsit a közönséget.',
    1913),
    (8,
    4,
    'Tor (részlet)',
    'A téli éjszakának vége volt... és messze, a fekete háztömegeken túl: ott, ahol a mező homályos vonalban végződik - egy szürke csík jelent meg az ég alján. Fönn még a csillagok pislogtak. És lenn a házak között, a mély, árnyéktalan sötétségben, ahol az alvó emberek lélegzése hallatszott, még semmit se tudtak arról a szürke csíkról.

    Maris megfordult az ágyában, kinyitotta a szemeit, és kinézett az ablakon. Azután gondolkodás nélkül hamar kiugrott az ágyából, és végigment a konyha hideg tégláin. Még a lábait se fázította. Meggyújtott egy kénes gyufát, s a haját a képéből elsimítva várta, míg fölgyullad a láng. Mikor ez megtörtént, meggyújtotta a konyhalámpást, és munkához fogott. Öltözködnie nemigen kellett, mert ruhástul aludt, csak éppen a réklijét vetette le. Végigfésülte a haját, nagy gyorsan összefonta, és feltűzte két hajtűvel. (Kicsiny, szőke haja volt, mint a kóc, nem kellett sokáig bajlódni.) Megvizezte és megdörzsölte piros, tizenöt éves leányarcát, megszappanozta erős, vörös, de finom szőke pelyhekkel borított kezeit.',
    1908);