-- What are the total number of seats available for elections in each state

SELECT 
s.state AS State_name,
COUNT(cr.parliament_constituency) AS Total_Seats
FROM  
constituencywise_results cr 
INNER JOIN statewise_results sr ON cr.parliament_constituency = sr.parliament_constituency
INNER JOIN states s ON sr.state_id = s.state_id 
GROUP BY s.state


-- Total Seats Won By NDA Alliance
SELECT 
     SUM(CASE 
	         WHEN party IN(
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
			  ) THEN [Won]
			  ELSE 0
			  END) AS NDA_Total_Seats_Won
FROM
     partywise_results


	 -- Seats Won By NDA Alliance Parties

SELECT 
     party as Party_Name,
	 won as Seats_Won
FROM
     partywise_results
WHERE
   party  IN(
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
ORDER BY Seats_Won DESC

     

-- Total Seats Won By I.N.D.I.A Alliance
SELECT
    SUM(CASE 
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
			 'Jammu & Kashmir National Conference - JKN',
			 'Kerala Congress - KEC',
			 'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			 'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			 'Rashtriya Janata Dal - RJD',
			 'Rashtriya Lok Dal - RLD',
			 'Revolutionary Socialist Party - RSP',
			 'Samajwadi Party - SP',
			 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			 'Viduthalai Chiruthaigal Katchi - VCK'
			 ) THEN [Won]
			 ELSE  0
			 END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results
    

	-- Seats Won By I.N.D.I.A Alliance Parties
	SELECT
        party,
		won FROM partywise_results
		WHERE party IN(
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
			 'Jammu & Kashmir National Conference - JKN',
			 'Kerala Congress - KEC',
			 'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
			 'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
			 'Rashtriya Janata Dal - RJD',
			 'Rashtriya Lok Dal - RLD',
			 'Revolutionary Socialist Party - RSP',
			 'Samajwadi Party - SP',
			 'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
			 'Viduthalai Chiruthaigal Katchi - VCK'
			 ) 
ORDER BY won DESC


-- Add new column field in table partywise_results to get the party alliance as NDA,I.N.D.I.A and Other

 ALTER TABLE partywise_results
 ADD party_alliance  VARCHAR(50)

 UPDATE partywise_results
 SET party_alliance = 'I.N.D.I.A'
 WHERE party IN(
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

-- NDA Allianz
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
-- OTHER
UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;

SELECT 
party,
won
FROM partywise_results
WHERE party_alliance = 'I.N.D.I.A'
ORDER BY won DESC


-- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?

SELECT 
    p.party_alliance,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
WHERE 
    p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY 
    p.party_alliance
ORDER BY 
    Seats_Won DESC;



	--Winning candidate's name, their party name, total votes, and 
	--the margin of victory for a specific state and constituency?

	SELECT 
	cr.Winning_Candidate,
	p.Party, 
	p.party_alliance, 
	cr.Total_Votes, 
	cr.Margin, 
	cr.Constituency_Name,
	s.State
   FROM constituencywise_results cr
   JOIN partywise_results p ON cr.Party_ID = p.Party_ID
   JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
   JOIN states s ON sr.State_ID = s.State_ID
   WHERE s.State = 'Uttar Pradesh' AND cr.Constituency_Name = 'AMETHI';



   -- What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
   SELECT 
    cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cr.Constituency_Name = 'MATHURA'
ORDER BY cd.Total_Votes DESC;


-- Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?
WITH RankedCandidates AS (
    SELECT 
        cd.Constituency_ID,
        cd.Candidate,
        cd.Party,
        cd.EVM_Votes,
        cd.Postal_Votes,
        cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
    FROM 
        constituencywise_details cd
    JOIN 
        constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
    JOIN 
        statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states s ON sr.State_ID = s.State_ID
    WHERE 
        s.State = 'Maharashtra'
)

SELECT 
 cr.Constituency_Name,
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates rc
JOIN 
    constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY 
    cr.Constituency_Name
ORDER BY 
    cr.Constituency_Name;






