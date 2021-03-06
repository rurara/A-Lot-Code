import requests
from bs4 import BeautifulSoup
from apscheduler.schedulers.background import BackgroundScheduler
import time

#HTML 코드를 가져오는 함수
def get_html(url):
   _html = ""
   resp = requests.get(url)
   if resp.status_code == 200:
      _html = resp.text
   return _html

#클리앙 잡 등록
def clienMarket():
    # 웹페이지 주소에 있는 내용을 html에 저장한다.
    url = "https://www.clien.net/service/board/sold"
    html = get_html(url)

    # soup에 html 코드를 저장한후 게시판 테이블의 내용을 저장한다.
    soup = BeautifulSoup(html, 'html.parser')
    listTable = soup.find("div", {"class": "list_content"}).find_all("div", {"class", "list_item symph_row"})

    # 게시판에 있는 목록을 한줄씩 파싱하여 항목별로 출력한다.
    for listRow in listTable:
        category = listRow.find("span", {"class": "category_fixed"}).text
        title = listRow.find("span", {"class", "subject_fixed"}).text.strip()
        link = listRow.find("a", {"class", "list_subject"})["href"]
        print(f'카테고리-{category}/제목-{title}/주소-{link}')

#스케쥴러를 생성한다
scheduler = BackgroundScheduler()
scheduler.start()
#id가 같은 작업은 한번에 하나만 실행된다.
scheduler.add_job(clienMarket, 'interval', seconds=60*5, id="clien")

#백그라운드에 프로세스가 죽지 않고 계속 실행되기 위해 반복문을 돌린다.
while True:
    print("일하고 있어요 :D")
    time.sleep(60)