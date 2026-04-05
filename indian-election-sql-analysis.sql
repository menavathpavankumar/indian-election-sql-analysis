#Total Seats
SELECT 
DISTINCT COUNT(parliament_constituency) AS Total_Seats
FROM india_election_results.constituencywise_results;

#What are the total number of seats available for elections in each state
USE india_election_results;
SELECT 
s.state AS State_name,
COUNT(DISTINCT cr.parliament_constituency) AS Total_Seats
FROM
constituencywise_results cr
INNER JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
INNER JOIN states s ON sr.state_id =s.state_id
GROUP BY s.state;

#Total Seats Won by NDA Alliance
SELECT 
     SUM(CASE
              WHEN party IN (
              'Bharatiya Janata Party - BJP',
              'Telugu Desam - TDP',
              'Janata Dal  (United) - JD(U)',
              'Shiv Sena - SHS',
              'AJSU Party - AJSUP',
              'Apna Dal (Soneylal) - ADAL',
              'Asom Gana Parishad - AGP',
              'Hindustani Awam Morcha (Secular) - HAMS',
              'Janasena Party - JnP',
              'Janata Dal  (Secular) - JD(S)',
              'Lok Janshakti Party(Ram Vilas) - LJPRV',
              'Nationalist Congress Party - NCP',
              'Rashtriya Lok Dal - RLD',
              'Sikkim Krantikari Morcha - SKM'
		            ) THEN won
                      ELSE 0
                      END
        ) AS NDA_Total_seats_Won
FROM partywise_results;        
        
#Seats Won by NDA Alliance Parties
SELECT 
party AS Party_Name,
won AS Seats_Won
FROM 
partywise_results
WHERE
     party IN (
     'Bharatiya Janata Party - BJP',
     'Telugu Desam - TDP',
     'Janata Dal  (United) - JD(U)',
     'Shiv Sena - SHS',
     'AJSU Party - AJSUP',
     'Apna Dal (Soneylal) - ADAL',
     'Asom Gana Parishad - AGP',
     'Hindustani Awam Morcha (Secular) - HAMS',
     'Janasena Party - JnP',
     'Janata Dal  (Secular) - JD(S)',
     'Lok Janshakti Party(Ram Vilas) - LJPRV',
     'Nationalist Congress Party - NCP',
     'Rashtriya Lok Dal - RLD',
     'Sikkim Krantikari Morcha - SKM'
     )
     ORDER BY Seats_Won DESC;
     
#Total Seats Won by indian Development Inclusive Alliance (I.N.D.I.A.)
SELECT
      SUM( CASE
               WHEN party IN(
               'Indian National Congress - INC',
               'Aam Aadmi Party - AAAP',
               'All India Trinamool Congress - AITC',
               'Bharat Adivasi Party - BHRTADVSIP',
               'Communist Party of India  (Marxist) - CPI(M)',
               'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
               'Communist Party of India - CPI',
               'Dravida Munnetra Kazhagam - DMK',
               'Indian Union Muslim League - IUML',
               'Jammu & Kashmir National Conference - JKN',
               'Jharkhand Mukti Morcha - JMM',
               'Kerala Congress - KEC',
               'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
               'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
               'Rashtriya Janata Dal - RJD',
               'Rashtriya Loktantrik Party - RLTP',
               'Revolutionary Socialist Party - RSP',
               'Samajwadi Party - SP',
               'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
               'Viduthalai Chiruthaigal Katchi - VCK'
               ) THEN won
               ELSE 0
               END
               )AS INDIA_Total_seats_Won
FROM partywise_results;
     
#Seats Won by I.N.D.I.A. Alliance Parties
SELECT 
Party AS Party_Name,
won AS Seats_Won
FROM partywise_results
WHERE
     party IN(
     'Indian National Congress - INC',
     'Aam Aadmi Party - AAAP',
     'All India Trinamool Congress - AITC',
     'Bharat Adivasi Party - BHRTADVSIP',
     'Communist Party of India  (Marxist) - CPI(M)',
     'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
     'Communist Party of India - CPI',
     'Dravida Munnetra Kazhagam - DMK',
     'Indian Union Muslim League - IUML',
     'Jammu & Kashmir National Conference - JKN',
     'Jharkhand Mukti Morcha - JMM',
     'Kerala Congress - KEC',
     'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
     'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
     'Rashtriya Janata Dal - RJD',
     'Rashtriya Loktantrik Party - RLTP',
     'Revolutionary Socialist Party - RSP',
     'Samajwadi Party - SP',
     'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
     'Viduthalai Chiruthaigal Katchi - VCK'
     )
     ORDER BY Seats_Won DESC;
     
#Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50) ;  
 
#UDATING INDI ALLIENCE.
SET SQL_SAFE_UPDATES =0;
UPDATE partywise_results
SET party_alliance ='I.N.D.I.A'
WHERE party IN (
      'Indian National Congress - INC',
      'Aam Aadmi Party - AAAP',
      'All India Trinamool Congress - AITC',
      'Bharat Adivasi Party - BHRTADVSIP',
      'Communist Party of India  (Marxist) - CPI(M)',
      'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
      'Communist Party of India - CPI',
      'Dravida Munnetra Kazhagam - DMK',
      'Indian Union Muslim League - IUML',
      'Jammu & Kashmir National Conference - JKN',
      'Jharkhand Mukti Morcha - JMM',
      'Kerala Congress - KEC',
      'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
      'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
      'Rashtriya Janata Dal - RJD',
      'Rashtriya Loktantrik Party - RLTP',
      'Revolutionary Socialist Party - RSP',
      'Samajwadi Party - SP',
      'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
       'Viduthalai Chiruthaigal Katchi - VCK'
       );
       
#UPDATING NDA ALLIENCE:
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
	 'Bharatiya Janata Party - BJP',
     'Telugu Desam - TDP',
     'Janata Dal  (United) - JD(U)',
     'Shiv Sena - SHS',
     'AJSU Party - AJSUP',
     'Apna Dal (Soneylal) - ADAL',
     'Asom Gana Parishad - AGP',
     'Hindustani Awam Morcha (Secular) - HAMS',
     'Janasena Party - JnP',
     'Janata Dal  (Secular) - JD(S)',
     'Lok Janshakti Party(Ram Vilas) - LJPRV',
     'Nationalist Congress Party - NCP',
     'Rashtriya Lok Dal - RLD',
     'Sikkim Krantikari Morcha - SKM'
     );
     
UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL   ;

#SIMPLE WAY TO WRITE CODE FOR TOTAL SEATS FOR ALL ALLIANCES
SELECT 
party_alliance,
SUM(won)
FROM   
partywise_results
GROUP BY party_alliance;

#ONLY FOR ONE ALLIENCE
SELECT
party,
WON
FROM
partywise_results
WHERE party_alliance = 'NDA'
ORDER BY won DESC;

#Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
SELECT
cr.winning_candidate,
pr.party,
pr.party_alliance,
cr.total_votes,
cr.margin,
s.state,
cr.constituency_name
FROM
constituencywise_results CR 
INNER JOIN partywise_results pr ON pr.party_id = cr.party_id
INNER JOIN statewise_results sr ON sr.parliament_constituency =cr.parliament_constituency
INNER JOIN states s ON s.state_id = sr.state_id
WHERE cr.constituency_name='NAGARKURNOOL';

#What is the distribution of EVM votes versus postal votes for candidates in a specific constituency and in which allience?
SELECT 
cd.evm_votes,
cd.postal_votes,
cd.total_votes,
cd.candidate,
pr.party_alliance,
cr.constituency_name
FROM 
constituencywise_results cr 
INNER JOIN partywise_results pr ON pr.party_id = cr.party_id
INNER JOIN constituencywise_details cd ON cr.constituency_id = cd.constituency_id
WHERE cr.constituency_name = 'NAGARKURNOOL'
ORDER BY cd.total_votes DESC;


#Which parties won the most seats in a State, and how many seats did each party win?
SELECT
pr.party,
pr.party_alliance,
COUNT(cr.constituency_id) AS Seats_Won
FROM
constituencywise_results cr
INNER JOIN partywise_results pr ON pr.party_id = cr.party_id
INNER JOIN statewise_results sr ON sr.parliament_constituency = cr.parliament_constituency
INNER JOIN states s ON s.state_id = sr.state_id
WHERE s.state = 'Telangana'
GROUP BY pr.party,pr.party_alliance
ORDER BY Seats_Won DESC;


#What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024.
SELECT
s.state,
SUM(CASE WHEN pr.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
SUM(CASE WHEN pr.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
SUM(CASE WHEN pr.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTher_Seats_Won
FROM
constituencywise_results cr
INNER JOIN partywise_results pr ON pr.party_id = cr.party_id
INNER JOIN statewise_results sr ON sr.parliament_constituency = cr.parliament_constituency
INNER JOIN states s ON s.state_id = sr.state_id
#WHERE s.state = 'TELANGANA'
GROUP BY s.state;

#Which candidate received the highest number of EVM votes in each constituency (Top 10)?
WITH Ranked AS (
    SELECT 
        cd.constituency_id,
        cd.candidate,
        cd.evm_votes,
        ROW_NUMBER() OVER(
            PARTITION BY cd.constituency_id
            ORDER BY cd.evm_votes DESC
        ) AS rn
    FROM constituencywise_details cd
    WHERE cd.evm_votes IS NOT NULL
)

SELECT 
    cr.constituency_name,
    r.constituency_id,
    r.candidate,
    r.evm_votes
FROM Ranked r
JOIN constituencywise_results cr 
    ON cr.constituency_id = r.constituency_id
WHERE r.rn = 1
ORDER BY r.evm_votes DESC
LIMIT 10;
    
#Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
WITH RankedCandidates AS (
				SELECT 
	                  cd.constituency_id,
                      cd.candidate,
                      cd.party,
                      evm_votes,
                      postal_votes,
                      (evm_votes + postal_votes) AS Total_Votes,
                      ROW_NUMBER() OVER(
                        PARTITION BY constituency_id
                        ORDER BY (evm_votes + postal_votes) DESC
                        ) AS Vote_Bank
				    FROM constituencywise_details cd
   left JOIN constituencywise_results cr ON cd.constituency_id = cr.constituency_id
  left  JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
  left  JOIN states s ON sr.state_id = s.state_id
    WHERE s.state = 'Telangana'
    )
 SELECT cr.constituency_name ,
        MAX(CASE WHEN rc.Vote_Bank = 1 THEN rc.candidate END) AS Winning_Candidate,
        MAX(CASE WHEN rc.Vote_Bank = 2 THEN rc.candidate END) AS Runnerup_Candidate
 FROM  RankedCandidates rc
 JOIN constituencywise_results cr ON cr.constituency_id = rc.constituency_id
 GROUP BY cr.constituency_name
 ORDER BY cr.constituency_name;
 

 
 #For the state of Telangana, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes
 SELECT 
    COUNT(DISTINCT cr.Constituency_ID) AS Total_Seats,
    COUNT(DISTINCT cd.Candidate) AS Total_Candidates,
    COUNT(DISTINCT p.Party) AS Total_Parties,
    SUM(cd.EVM_Votes + cd.Postal_Votes) AS Total_Votes,
    SUM(cd.EVM_Votes) AS Total_EVM_Votes,
    SUM(cd.Postal_Votes) AS Total_Postal_Votes
FROM 
    constituencywise_results cr
JOIN 
    constituencywise_details cd ON cr.Constituency_ID = cd.Constituency_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    s.State ='Telangana';