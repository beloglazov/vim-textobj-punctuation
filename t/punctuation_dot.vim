filetype plugin on
runtime! plugin/textobj/punctuation.vim

describe 'iu'

    before
        new
    end

    after
        close!
    end

    it 'within the current line'
        put! = '.'
        normal diu
        Expect getline(1) == ''
    end

    it 'within the current line'
        put! = 'test.'
        normal diu
        Expect getline(1) == '.'
    end

    it 'within the current line'
        put! = 'test. qwe'
        normal diu
        Expect getline(1) == '. qwe'
    end

    it 'within the current line'
        put! = 'test. qwe.'
        normal diu
        Expect getline(1) == '. qwe.'
    end

    it 'within the current line'
        put! = 'test. qwe.'
        normal! fq
        normal diu
        Expect getline(1) == 'test. .'
    end

    it 'multiline'
        put = '.'
        normal! k
        normal diu
        Expect getline(1) == '.'
        Expect getline(2) == ''
    end

    it 'multiline'
        put! = '.'
        put! = 'test'
        normal! k
        normal diu
        Expect getline(1) == '.'
        Expect getline(2) == ''
    end

    it 'multiline'
        put! = 'qwe.'
        put! = 'test'
        normal! k
        normal diu
        Expect getline(1) == '.'
        Expect getline(2) == ''
    end

    it 'multiline'
        put! = 'qwe. asd.'
        put! = 'test'
        normal! k
        normal diu
        Expect getline(1) == '. asd.'
        Expect getline(2) == ''
    end

end


describe 'au'

    before
        new
    end

    after
        close!
    end

    it 'within the current line'
        put! = '.'
        normal dau
        Expect getline(1) == ''
    end

    it 'within the current line'
        put! = 'test.'
        normal dau
        Expect getline(1) == ''
    end

    it 'within the current line'
        put! = 'test. qwe'
        normal dau
        Expect getline(1) == ' qwe'
    end

    it 'within the current line'
        put! = 'test. qwe.'
        normal dau
        Expect getline(1) == ' qwe.'
    end

    it 'within the current line'
        put! = 'test. qwe.'
        normal! fq
        normal dau
        Expect getline(1) == 'test. '
    end

    it 'multiline'
        put = '.'
        normal! k
        normal dau
        Expect getline(1) == ''
        Expect getline(2) == ''
    end

    it 'multiline'
        put! = '.'
        put! = 'test'
        normal! k
        normal dau
        Expect getline(1) == ''
        Expect getline(2) == ''
    end

    it 'multiline'
        put! = 'qwe.'
        put! = 'test'
        normal! k
        normal dau
        Expect getline(1) == ''
        Expect getline(2) == ''
    end

    it 'multiline'
        put! = 'qwe. asd.'
        put! = 'test'
        normal! k
        normal dau
        Expect getline(1) == ' asd.'
        Expect getline(2) == ''
    end

end