`timescale 1ns / 1ps
module bucket_sort(
    input clk, reset, R_I, [15:0] data_in,
    output R_O, done, emptyness, error, reg [15:0] data_out,
    output [3:0] st, 
    output reg led0, led1, led2, led3, led4, led5, led6, led7, led8, 
    output reg led9, led10, led11,  led12, led13, led14, led15
);

reg [15:0] size, next_size, data_in_buf, cnt_ind, next_cnt_ind, minimum, next_min, maximum, bucket_size_gen, count_bucketted, next_count_bucketted;
reg [15:0] array [15:0];
reg [15:0] buckets [3:0][15:0];
reg [15:0] bucket_sizes [3:0];
reg [15:0] bucket_indexes [3:0];
reg [15:0] array_sorted [15:0];
reg [3:0] state, next_state;
reg is_bucketted [15:0];
reg found_min, next_found_min, proc;
reg [2:0] cnt, next_cnt;
reg compl, empty, err;
parameter INIT = 0, CHECK_SIZE = 1, GET_ARRAY = 2, MIN_MAX_FIND = 3, BUCKET_SIZE_COUNT = 4, BUCKETTING = 5, MAKE_ARRAY = 6, RETURN_ARRAY = 7, EMPTY = 9, EQUALS = 8, DONE = 15; 
integer i;
    
initial begin
    state = INIT;
    next_state = INIT;
    cnt_ind = 0;
    next_cnt_ind = 0;
    minimum = 16'hFFFF;
    next_min = 16'hFFFF;
    maximum = 1'b0;
    bucket_size_gen = 0;
    size = 0;
    next_size = 0;
    count_bucketted = 0;
    next_count_bucketted = 0;
    bucket_indexes[0] = 0;
    bucket_indexes[1] = 0;
    bucket_indexes[2] = 0;
    bucket_indexes[3] = 0;
    found_min = 0;
    cnt = 0;
    proc = 0;
    next_cnt = 0;
    compl = 0;
    empty = 0;
    err = 0;
    data_in_buf = 0;
    led0 = 0;
    led1 = 0;
    led2 = 0;
    led3 = 0;
    led4 = 0;
    led5 = 0;
    led6 = 0;
    led7 = 0;
    led8 = 0;
    led9 = 0;
    led10 = 0;
    led11 = 0;
    led12 = 0;
    led13 = 0;
    led14 = 0;
    led15 = 0;
    for (i = 0; i < 16; i = i + 1)
        is_bucketted[i] = 1'b0;
end

always@(posedge clk) begin
    if(reset) 
        next_state <= INIT;
    else
        case(state)
            INIT: begin
                led0 <= 1;
                led1 = 0;
                led2 = 0;
                led3 = 0;
                led4 = 0;
                led5 = 0;
                led6 = 0;
                led7 = 0;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(R_I) begin
                    next_size <= data_in;
                    next_state <= CHECK_SIZE;
                end
                else begin
                    next_state <= state;
                    next_cnt_ind <= 0;
                    next_count_bucketted <= 0;
                    next_cnt <= 0;
                    next_min <= 0;
                    next_size <= 0;
                end
            end
            CHECK_SIZE: begin
                led1 <= 1;
                led2 = 0;
                led3 = 0;
                led4 = 0;
                led5 = 0;
                led6 = 0;
                led7 = 0;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(size != 0 && size < 17) begin
                    next_state <= GET_ARRAY;
                    data_out <= size;
                end
                else begin 
                    next_state <= EMPTY;
                    empty <= 1;
                    if(size > 16)
                        err <= 1;
                    else 
                        err <= 0;
                end
            end
            GET_ARRAY: begin
                led2 <= 1;
                led3 = 0;
                led4 = 0;
                led5 = 0;
                led6 = 0;
                led7 = 0;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(cnt_ind < size) begin
                    if(R_I) begin
                        array[cnt_ind] <= data_in_buf;
                        next_cnt_ind <= cnt_ind + 1;
                        data_out <= data_in_buf;
                    end
                    else next_cnt_ind <= cnt_ind;
                    next_state <= state;
                end
                else begin
                    next_state <= MIN_MAX_FIND;
                    next_cnt_ind <= 0;
                end
            end
            MIN_MAX_FIND: begin
                led3 <= 1;
                led4 = 0;
                led5 = 0;
                led6 = 0;
                led7 = 0;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(cnt_ind < size) begin
                    if(minimum > array[cnt_ind]) next_min <= array[cnt_ind];
                    else next_min <= minimum;
                    if(maximum < array[cnt_ind]) maximum <= array[cnt_ind];
                    else maximum <= maximum;
                    next_cnt_ind <= cnt_ind + 1;
                    next_state <= state;
                end
                else begin
                    if(minimum == maximum) next_state <= EQUALS;
                    else next_state <= BUCKET_SIZE_COUNT;
                    next_cnt_ind <= 0;
                end
            end
            BUCKET_SIZE_COUNT: begin
                led4 <= 1;
                led5 = 0;
                led6 = 0;
                led7 = 0;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(proc) next_state <= BUCKETTING;
                else begin
                    proc <= 1;
                    case(size % 4)
                        1: begin
                            bucket_sizes[0] <= bucket_size_gen + 1;
                            bucket_sizes[1] <= bucket_size_gen;
                            bucket_sizes[2] <= bucket_size_gen;
                            bucket_sizes[3] <= bucket_size_gen;
                        end
                        2: begin
                            bucket_sizes[0] <= bucket_size_gen + 1;
                            bucket_sizes[1] <= bucket_size_gen + 1;
                            bucket_sizes[2] <= bucket_size_gen;
                            bucket_sizes[3] <= bucket_size_gen;
                        end
                        3: begin
                            bucket_sizes[0] <= bucket_size_gen + 1;
                            bucket_sizes[1] <= bucket_size_gen + 1;
                            bucket_sizes[2] <= bucket_size_gen + 1;
                            bucket_sizes[3] <= bucket_size_gen;
                        end
                        default: begin
                            bucket_sizes[0] <= bucket_size_gen;
                            bucket_sizes[1] <= bucket_size_gen;
                            bucket_sizes[2] <= bucket_size_gen;
                            bucket_sizes[3] <= bucket_size_gen;
                        end
                    endcase
                    next_state <= state;
                end
            end
            BUCKETTING: begin
                led5 <= 1;
                led6 = 0;
                led7 = 0;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(cnt_ind == size) begin
                    next_state <= state;
                    next_cnt_ind <= 0;
                    if(!found_min)
                        next_min <= minimum + 1;
                    else begin
                        next_min <= minimum;
                        found_min <= 0;
                    end
                end
                else begin
                    next_cnt_ind <= cnt_ind + 1;
                    if(count_bucketted < size) begin
                        next_state <= state;
                        if(bucket_indexes[cnt] < bucket_sizes[cnt]) begin                  
                            if (array[cnt_ind] == minimum && !is_bucketted[cnt_ind]) begin
                                found_min <= 1;
                                buckets[cnt][bucket_indexes[cnt]] <= array[cnt_ind];
                                is_bucketted[cnt_ind] <= 1;
                                next_count_bucketted <= count_bucketted + 1;
                                bucket_indexes[cnt] <= bucket_indexes[cnt] + 1;
                            end
                            else begin
                                found_min <= found_min;
                                next_count_bucketted <= count_bucketted;
                            end
                        end
                        else begin
                            next_cnt <= cnt + 1;
                            bucket_indexes[cnt] <= 0;
                        end
                    end
                    else begin
                        next_state <= MAKE_ARRAY;
                        next_cnt <= 0;
                        next_cnt_ind <= 0;
                        next_count_bucketted <= 0;
                        bucket_indexes[cnt] <= 0;
                    end
                end
            end
            MAKE_ARRAY: begin
                led6 <= 1;
                led7 = 0;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(count_bucketted < size) begin
                    next_state <= state;
                    if(bucket_indexes[cnt] < bucket_sizes[cnt]) begin
                         array_sorted[cnt_ind] <= buckets[cnt][bucket_indexes[cnt]];
                         next_cnt_ind <= cnt_ind + 1;
                         bucket_indexes[cnt] <= bucket_indexes[cnt] + 1;
                         next_count_bucketted <= count_bucketted + 1;
                         next_cnt <= cnt;
                    end
                    else begin
                        next_cnt <= cnt + 1;
                        next_cnt_ind <= cnt_ind;
                        next_count_bucketted <= count_bucketted;
                    end
                end
                else begin
                    next_cnt_ind <= 0;
                    next_state <= RETURN_ARRAY;
                end
            end
            RETURN_ARRAY: begin
                led7 <= 1;
                led8 = 0;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(cnt_ind < size) begin
                    next_state <= state;
                    if(R_I) begin;
                        data_out <= array_sorted[cnt_ind];
                        next_cnt_ind <= cnt_ind + 1;
                    end
                    else begin
                        next_cnt_ind <= cnt_ind;
                    end
                end
                else begin
                    next_state <= DONE;
                    next_cnt_ind <= 0;
                end
            end
            EQUALS: begin
                led8 <= 1;
                led9 = 0;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                if(R_I) begin
                    if(cnt_ind < size) begin
                        next_state <= state;
                        data_out <= array[cnt_ind];
                        next_cnt_ind <= cnt_ind + 1;
                    end
                    else begin
                        next_cnt_ind <= 0;
                        next_state <= DONE;
                    end
                end
                else begin
                    next_cnt_ind <= cnt_ind;
                    next_state <= state;
                end
            end
            EMPTY: begin
                led9 <= 1;
                led10 = 0;
                led11 = 0;
                led12 = 0;
                led13 = 0;
                led14 = 0;
                led15 = 0;
                next_state <= DONE;
                empty <= 1;
            end
            DONE: begin
                led15 <= 1;
                compl <= 1;
                next_state <= state;
            end
        endcase
end

always@* begin
    state <= next_state;
    cnt_ind <= next_cnt_ind;
    data_in_buf <= data_in;
    cnt <= next_cnt;
    count_bucketted <= next_count_bucketted;
    minimum <= next_min;
    bucket_size_gen <= size / 4;
    size <= next_size;
end

assign R_O = data_out != 0;
assign emptyness = empty;
assign done = compl;
assign error = err;

assign st = state;
endmodule