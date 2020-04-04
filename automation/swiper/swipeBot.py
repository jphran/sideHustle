import time
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options



class swipeBot():
    def __init__(self):
        #explicitly set incognito mode
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_argument("--incognito") 

        self.driver = webdriver.Chrome('./chromedriver', options=chrome_options) #open browser

    def findAndClickBtn(self, btn_xpath):
        self.driver.find_element_by_xpath(btn_xpath).click()

    #sends ENTER as last key
    def findAndSendKeysToInput(self, input_xpath, keysToSend):
        self.driver.find_element_by_xpath(input_xpath).send_keys(keysToSend + Keys.ENTER)

    def login(self):
        chrome_options = Options()
        # incognito window
        chrome_options.add_argument("--incognito")
        self.driver.get('https://tinder.com/?lang=en') #open url
        time.sleep(5) #wait 5 sec for browser to load

        #select login
        self.findAndClickBtn("//span[contains(text(), 'Log in with phone number')]")
        time.sleep(1)
        #enter phone number
        self.findAndSendKeysToInput('/html/body/div[2]/div/div/div[2]/div[2]/div/input', '8015136973')

    def enterSecurityCode(self, securityCode):
        self.findAndSendKeysToInput('//*[@id="modal-manager"]/div/div/div[2]/div[2]/input[1]', securityCode)

    def setup(self, isSetNewLocation):
        #allow location sharing popup
        time.sleep(1)
        self.findAndClickBtn('/html/body/div[2]/div/div/div/div/div[3]/button[1]')
        # allowLocationTracking_btn = self.driver.find_element_by_xpath('/html/body/div[2]/div/div/div/div/div[3]/button[1]')
        # allowLocationTracking_btn.click()

        #enable notifications popup
        time.sleep(1)
        self.findAndClickBtn('/html/body/div[2]/div/div/div/div/div[3]/button[1]')
        # enableNotifications_btn = self.driver.find_element_by_xpath('/html/body/div[2]/div/div/div/div/div[3]/button[1]')
        # enableNotifications_btn.click()

        #set location page
        time.sleep(1)
        self.findAndClickBtn('/html/body/div[2]/div/div/div[2]/a')
        # setLocation_btn = self.driver.find_element_by_xpath('/html/body/div[2]/div/div/div[2]/a')
        # setLocation_btn.click()

        #email confirmation
        # self.findAndClickBtn('//*[@id="modal-manager"]/div/div/div[2]/div[2]/button[2]')
        # remindLater_btn = self.driver.find_element_by_xpath('//*[@id="modal-manager"]/div/div/div[2]/div[2]/button[2]')
        # remindLater_btn.click()

        #add new location
        time.sleep(1)
        self.findAndClickBtn('/html/body/div[1]/div/div[1]/div/div/main/div/div[2]/div/div[2]/button')
        # addNewLoc_btn = self.driver.find_element_by_xpath('/html/body/div[1]/div/div[1]/div/div/main/div/div[2]/div/div[2]/button')
        # addNewLoc_btn.click()

    def autoSwipe(self, collectSongs):
        while True:
            if collectSongs:
                self.saveAnthem()

            try: //*[@id="content"]/div/div[1]/div/div/main/div/div/div[2]/div/div/div[4]/button
                self.findAndClickBtn('//*[@id="content"]/div/div[1]/div/div/main/div/div[1]/div/div[2]/div[4]/button')
                time.sleep(0.5)
            except Exception:
                try: #match, select 'keep swiping'
                    self.findAndClickBtn('//*[@id="modal-manager"]/div/div/div/div/div[3]/a')
                except:
                    return

    def dislike(self):
        self.findAndClickBtn('//*[@id="content"]/div/div[1]/div/div/main/div/div[1]/div/div[2]/div[2]/button')

    def saveAnthem(self):
        #navigate to info page
        self.findAndClickBtn('//*[@id="content"]/div/div[1]/div/div/main/div/div[1]/div/div[1]/div[3]/div[6]/button')
        #pull data
        songTitle = self.driver.find_element_by_xpath('//*[@id="content"]/div/div[1]/div/div/main/div/div/div[1]/div/div[2]/div[3]/div/div/div/div[1]').text
        artist = self.driver.find_element_by_xpath('//*[@id="content"]/div/div[1]/div/div/main/div/div/div[1]/div/div[2]/div[3]/div/div/div/div[2]/span').text

        #save data
        with open("songList.txt", "w") as f: 
            f.write(songTitle + ",\t" + artist + "\n") 
        #TODO: consolidate this and the autoswiper, xpath is differnent if you go into info
        self.findAndClickBtn('//*[@id="content"]/div/div[1]/div/div/main/div/div/div[2]/div/div/div[4]/button')

bot = swipeBot()
bot.login()