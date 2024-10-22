# Cristiano Ronaldo vs Lionel Messi: Data Cleaning and Visualization Project
## Overview
This project focuses on data cleaning, preprocessing, and visualizing football data, specifically comparing Cristiano Ronaldo and Lionel Messi's performance. The dataset contains information about goals scored, time of goals, competition, venue, and more. In this project, several techniques such as data cleaning, transformation, and visualization are applied using R, along with generating a word cloud for textual data analysis.

## Technologies Used
- R Programming: Data processing, visualization, and text analysis.
- Libraries Used:
    - dplyr, tidyverse, ggplot2, PerformanceAnalytics, Hmisc: For data manipulation and visualization.
    - tm, SnowballC, wordcloud, RColorBrewer: For text mining and generating a word cloud.
    - stats, psych: For statistical analysis.
    - ggfortify: For creating visualizations.
## Project Structure
The project includes:
- Data Cleaning & Preprocessing:

    - Loaded the dataset and explored the structure.
    - Handled missing values by removing rows with NA.
    - Cleaned the min column, which represents the minute a goal was scored, and converted it into a numeric type.
    - Created a new variable Time_Class to categorize goals into 'First_Half', 'Second_Half', and 'Extra_Time'.
    - Converted date information into structured Year, Month, and Weekday formats.
- Visualizations:
    - Bar Plot: Showing the number of goals by type and player.
    - Density Plot: Visualizing the density of players in different competition leagues and venues.
- Text Mining and Word Cloud:
    - Created a word cloud using opponent data (opp column) to visualize the most frequent opponents faced by both players.
    - Text cleaning steps included converting to lowercase, removing punctuation, eliminating stopwords, and stemming.
## Dataset
The dataset used is a CSV file containing match details of both Cristiano Ronaldo and Lionel Messi.

Columns:
- min: Minute of the goal scored.
- player: The player who scored the goal.
- type: Type of goal.
- date: Date of the match.
- comp: The competition in which the goal was scored.
- venue: Venue of the match (Home/Away/Neutral).
- opp: Opponent team.
## Visualizations
- Bar Plot: Number of goals by type for each player.
- Density Plot: Players in each Champion League with the venue.
- Word Cloud: Visualization of the most frequent opponents faced by Cristiano Ronaldo and Lionel Messi.
