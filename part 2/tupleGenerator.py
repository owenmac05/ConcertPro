# Owen MacDonald - Project 2 Q9 Tuple Generator

import random

NUM_TICKETS = 100 # Number of tickets to generate

# Concert tuples (foreign keys)
concerts = [(10001, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-20'),
            (416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-27'),
            (98765, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-13'),
            (9999, '7506 Rue Mouton, Quebec, Canada', '2026-06-23'),
            (416, '1909 Avenue des Canadien-de-Montreal, Montreal, Canada', '2026-03-28'),
            (416, '456 South Mountain Boulevard, Vancouver, Canada', '2026-04-01'),
            (67, '456 South Mountain Boulevard, Vancouver, Canada', '2026-05-12'),
            (480, '164 Sunnyside Road, Ottawa, Canada', '2027-12-12'),
            (480, '164 Sunnyside Road, Ottawa, Canada', '2026-03-27')]

# Possible sections for each venue at a concert
sections = ([str(i) for i in range(101, 131)] 
            + [str(i) for i in range(201, 231)] 
            + [str(i) for i in range(301, 331)] 
            + [str(i) for i in range(401, 431)]
            + ["VIP", "General Admission"])

usedKeys = set() # Remember set of used primary keys (prevents duplicates)
tickets = [] # Generated ticket tuples

# Loop until NUM_TICKETS reached
while len(tickets) < NUM_TICKETS:
    # Choose random concert, section and seat number
    concert = random.choice(concerts)
    section = random.choice(sections)
    seat = random.randint(1, 30)
    
    # Check if key has already been used, if so, generate new ticket
    key = (*concert, section, seat)
    if key in usedKeys:
        continue
    # If key hasn't already been used, add it to usedKeys and proceed
    usedKeys.add(key)
    
    # Generate a realistic price depending on the section (random float rounded to 2 decimal places)
    if section == "VIP":
        price = round(random.uniform(400, 500), 2)
    elif section == "General Admission":
        price = round(random.uniform(300, 400), 2)
    elif section.startswith("1"): # 100s
        price = round(random.uniform(200, 300), 2)
    elif section.startswith("2"): # 200s
        price = round(random.uniform(150, 200), 2)
    elif section.startswith("3"): # 300s
        price = round(random.uniform(100, 150), 2)
    else: # 400s
        price = round(random.uniform(50, 100), 2)

    # Add ticket to ticket list
    tickets.append((*concert, section, seat, price))

# Format output to copy paste in SQL insert statement
outputTuples = []
for t in tickets:
    # Format each tuple for SQL syntax
    outputTuples.append(f"({t[0]}, '{t[1]}', '{t[2]}', '{t[3]}', {t[4]}, {t[5]})")
# Join tuples with comma and newline
print(",\n".join(outputTuples))

# Flaws:
# 1. The probability of generating a tuple with sections "VIP" or "General Admission" are quite low
# because there's so many other sections to choose from in the list.
# 2. In reality there are venues that have sections labelled differently (like section "4D" instead of "404" for example),
# different number of seats in a row, different number of sections, different layouts, etc.
# This program does not represent that because it would require having different constraints for every venue.
# So for simplicity, this program assumes all venues have the same layout.
# 3. In reality, the price range of the same section should be different between artists
# (seeing one artist in concert might generally be more expensive than seeing another). So for simplicity,
# we assume all artists have equal ticket price range.