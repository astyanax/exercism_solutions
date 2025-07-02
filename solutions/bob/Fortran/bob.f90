module bob
  implicit none
contains

  function hey(statement)
    character(100) :: hey
    character(len=*), intent(in) :: statement
    logical :: is_question, is_yelling, is_silence
    character(len=:), allocatable :: trimmed_stmt
    integer :: i, alpha_count

    ! Trim the statement and convert to allocatable
    trimmed_stmt = trim(adjustl(statement))
    
    ! Check if it's silence
    is_silence = len(trimmed_stmt) == 0
    
    ! Check if it's a question
    is_question = .false.
    if (len(trimmed_stmt) > 0) then
      is_question = trimmed_stmt(len(trimmed_stmt):len(trimmed_stmt)) == '?'
    end if
    
    ! Check if it's yelling (all uppercase with at least one letter)
    is_yelling = .true.
    alpha_count = 0
    do i = 1, len(trimmed_stmt)
      if (trimmed_stmt(i:i) >= 'a' .and. trimmed_stmt(i:i) <= 'z') then
        is_yelling = .false.
        exit
      end if
      if (trimmed_stmt(i:i) >= 'A' .and. trimmed_stmt(i:i) <= 'Z') then
        alpha_count = alpha_count + 1
      end if
    end do
    is_yelling = is_yelling .and. (alpha_count > 0)
    
    ! Determine Bob's response
    if (is_silence) then
      hey = "Fine. Be that way!"
    else if (is_yelling .and. is_question) then
      hey = "Calm down, I know what I'm doing!"
    else if (is_yelling) then
      hey = "Whoa, chill out!"
    else if (is_question) then
      hey = "Sure."
    else
      hey = "Whatever."
    end if

  end function hey

end module bob