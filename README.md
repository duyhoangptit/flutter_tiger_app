# Bloc pattern
    Stream, băng chuyền hay gọi là luồng
    StreamController, là thứ điều khiển Stream
    StreamTransformer, là thứ xử lý dữ liệu đầu vào
    StreamBuilder, là phương thức lấy Stream làm đầu vào và provide một builder mỗi khi có giá trị mới của Stream được đưa ra
    sink, thuộc tính lấy đầu vào
    stream, thuộc tính cung cấp đầu ra khỏi luồng

# 
    Input được lấy thông qua sink property
    Output được cung cấp bằng cách sử dụng stream property
    Widgets bắn event tới BLoC thông qua sinks
    BLoC notify thay đổi đến Widget thông qua stream
    Bât giờ thì Business Logic và UI component đã được tách ra, chúng ta có thể thay đổi business logic mọi lúc mà không làm ảnh hưởng đến các thành phần UI
    Tương tự, chúng ta cõ thể thay đổi các UI component mà không có bất kỳ tác động nào đến business logic