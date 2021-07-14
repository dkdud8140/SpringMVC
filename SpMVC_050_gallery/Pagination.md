# Pagination
* 많은 데이터 리스트가 셀렉트 되었을 때 전체 List를 한 화면에 보여주면 보는데 상당히 어려움이 있을 것이다
* 그래서 한 화면에 일정한 리스트의 분량만 보여주고 
* List 하단에 page navigation을 표현하여
* page num을 클릭하면 이후 list를 조회하여 보여주는 방식.

## Pagination 설계할 때 요구사항
* 한 화면에 몇 개의 List를 보여줄 것인가 : 보통 10개정도
* page navigation의 개수는 몇 개 보여줄 것인가 : 보통 5개 혹은 10개 표시
* 처음으로 가기 : 1page list 보기
* 끝으로 가기 : 제일 마지막 list 중에 보이기
* 이전으로 가기, 이후로 가기 : 현재 보고 있는 page에서 앞, 뒤로 가기

* 보고 있는 화면에서 page Nav 번호를 클릭했을 때 controller에 전달하는 값  
page numver만 전달하기, 검색어와 함께 전달하기, 검색어/정렬기준과 함께 전달하기.

## 이 프로젝트에서 pagination 구현하기
* SQL SELECT 표준 SQL SELECT만 사용하기
* Java 코드에서 pagination 구현하기
* 1.8 미만에서 사용하는 코드 1.8이상에서 구현하는 코드

*1.8 이상의 코드 : Lambda, Stream(List 데이터에 대한)