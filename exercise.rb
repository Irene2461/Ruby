class Person
    @@count = 0 #   Class Person có 1 class variable là count
    def initialize(name,age)
        @name, @age = name, age #   Person có 2 instance variable là 'name' và 'age'
        @@count+=1  #   Mỗi lần khởi tạo 1 Person count sẽ tăng lên 1
    end
    #   Tạo setter và getter cho 'name' và 'age'
    def setAge(newAge)
        @age = newAge
    end
    def setName(newName)
        @name = newName
    end
    def getName()
        @name
    end   
    def getAge()
        @age
    end      

    def introduce # Person có 1 instane method tên là 'introduce'
        puts "My name is #@name. I'm #@age years old"   # "My name is [name của person đó]. I'm [age của person đó] years old"
    end
    def self.total_count #  Person có 1 class method tên là 'total_count' 
        puts "Total number of people is #@@count"   
    end
end


#   Dùng hàm 'times' tạo 1 mảng 'people' gồm 20 person
def init_array
    people = Array.new(20){Person.new("",0)}
    person_count = 0
    people.length.times do |i|
        person_count += 1
        people[i].setName("Person " + person_count.to_s)    #   name là 'Person 1' cho đến 'Person 20'
        people[i].setAge(Random.new.rand(10..90))   #   age của mỗi Person random từ 10 -> 90
    end
    return people
end

people = init_array() 


#   Ham nay chi de print array ra cho dep ^.^
def printArray(array)
    for i in array
        puts i.getName.to_s + " " + i.getAge.to_s
    end
end

# printArray(people)

# p1 = Person.new('Ngoc_1',21)
# p2 = Person.new('Ngoc_2',22)
# puts p2.getAge()
# p2.introduce 
# Person.total_count

people_sm_18_sl = people.select {|person| person.getAge < 18}   #   Với mảng 'people' lọc ra những Person có tuổi nhỏ hơn 18
people_sm_18_rm = people.reject {|person| person.getAge < 18}   #   Với mảng 'people' xóa những Person có tuổi nhỏ hơn 18
people_sort_asc = people.sort_by {|person| person.getAge}       #   Sort mảng 'people' theo tuổi tăng dần.
people_sort_dsc = people.sort_by {|person| person.getAge}.reverse   #   Sort mảng 'people' theo tuổi giảm dần.

people.delete_at(0)     #   Delete 1 phần tử ở vị trí xác định trong mảng 'people'


# printArray(people)
# puts "======================================="
# printArray(people)

max_person = people.max_by {|person| person.getAge}     #   Person lớn tuổi nhất
min_person = people.min_by {|person| person.getAge}     #   Person nhỏ tuổi nhất
puts "Max: " + max_person.getName.to_s + " - " + "Min: " + min_person.getName.to_s

#   For loop
for person in people
    person.setAge(person.getAge + 1)
end

#   While loop
$i = 0
$num = people.length
while $i < $num  do
   people[$i].setAge(people[$i].getAge + 1)
   $i +=1
end
begin 
    people[$i].setAge(people[$i].getAge + 1)
    $i +=1
end while $i < $num

#   Iterator
people.each do |person|
    person.setAge(person.getAge + 1)
end

# Until statement dung giong While -- too lazy to code T.T

# Methods
people.map{|person| person.setAge(person.getAge + 1)}
people.collect {|person| person.setAge(person.getAge + 1)}

# printArray(people)

#   Không dùng vòng lặp (dùng CÁC hàm của Array) lấy ra tất cả các 'age' của các Person trong mảng 'person'
people.select {|person| puts person.getAge}

#   Tạo 1 mảng 'people_2' tương tự câu 7, nối mảng 'people_2' vào 'people'
people_2 = init_array()
people.concat(people_2)     #   Concat() method
people = people + people_2  #   Operator +

# printArray(people)


#   Raise Argument Error voi msg la "cannot devide by 0" khi truyen vao so 0 vao argument b
def division(a,b)
    raise ArgumentError unless b != 0
    return (a * 1.0) / (b * 1.0)
end
begin
    result = division(3,0)
rescue ArgumentError
    puts "Cannot divide by 0"
else 
    print(result)
end
 
