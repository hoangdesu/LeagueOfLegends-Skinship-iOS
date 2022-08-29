"""
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Hoang Nguyen
 ID: s3697305
 Last modified: 29/08/2022
 """

import json
# import os

# TILES_PATH = '../tiles/'
# LOADING_PATH = '../loadings/'

# tiles = os.listdir(TILES_PATH)
# print(tiles)
# print(len(tiles))

# CLEAN UP DATA

champions = []

with open('championFull.json') as file:
    championFull = json.load(file)
    data = championFull['data']
    # keys = data.keys()
    # print()
    for champion in data:
        # print(champion)
        id = data[champion]['id']
        name = data[champion]['name']
        title = data[champion]['title'].title() 
        defaultSkin = f'{id}_0'

        skins = data[champion]['skins']  
        
        # print(f'--- {name}:')
        
        filtered_skins = []
        
        for skin in skins:
            if skin['num'] == 0:
                continue
            
            # print(skin)
            
            filtered_skins.append({
                'id': int(skin['id']),
                'name': skin['name'],
                'loading': f'{id}_{skin["num"]}'
            })
        
        # print(filtered_skins)
        
        champions.append({
            'id': id,
            'name': name,
            'title': title,
            'defaultSkin': defaultSkin,
            'skins': filtered_skins
        })

        file.close()

# PREVIEW DATA
for champ in champions:
    print(champ)
    print('Skins:')
    for skin in champ['skins']:
        print(skin)
    print()

# DUMP TO JSON FILE
with open('./output/champions.json', 'w') as file:
    json.dump(champions, file, indent=4)
    
