## 스파르타 코딩클럽 내일배움캠프 🍎 iOS 트랙

### 투두 리스트 과제 📝

<img width="210" alt="투두 리스트 과제 Read Me 1" src="https://github.com/dave17code/TeamSpaToDoList/assets/151927621/f96ac3af-437b-4174-b25c-278d0b8cbba4"><img width="210" alt="투두 리스트 과제 Read Me 2" src="https://github.com/dave17code/TeamSpaToDoList/assets/151927621/0a036637-8e82-4020-b6d2-924b27021dba"><img width="210" alt="투두 리스트 과제 Read Me 3" src="https://github.com/dave17code/TeamSpaToDoList/assets/151927621/7092dedc-48c9-498c-b99b-a42e5ee983da">

---
#### 💡 배운점    

1. UITableView, UITableViewCell의 활용 

   - 테이블뷰와 테이블뷰 셀을 델리게이트 패턴으로 사용해보았다.

2. UIAlertController를 이용한 텍스트 입력 받기

   - 스스로 생각해낸 방법은 아니고 과제에서 UIAlertController를 이용해서 텍스트를 입력 받으라고 제시해놨기 때문에 사용하게 되었다.

   - AlertController에는 텍스트 필드를 자신에게 추가하는 메소드가 기본 탑재 되어 있었다. 아이폰 유저라면 Apple ID 암호를 입력할 때 자주 사용하던 방식

   - UIAlertController는 기본 디자인을 커스텀 하는 것을 거의 막아놓은 상태이고 권장하지도 않는다. 편법을 써서 강제로 디자인을 커스텀 하는 코드가 있지만 Apple HIG를 어기는 것임

3. UIContextualAction과 UISwipeActionsConfiguration를 활용한 테이블셀 삭제

   - 테이블뷰 셀에 대한 사용자 입력을 받는데에 있어서 가장 간편하고 기본적으로 활용할 수 있는 기능들이다. 애플이 직접 제공하는 기능이어서 디자인 커스텀은 매우 제한적이다.
     
4. UserDefaults 사용

   - UserDefaults는 애플이 기본 제공하는 데이터 저장 방식으로 간편하게 사용할 수 있었다. 하지만 앱을 삭제할 시에는 데이터 저장이 불가능함
