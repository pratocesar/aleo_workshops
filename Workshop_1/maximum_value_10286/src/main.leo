// The 'maximum_value_10286' program.
program maximum_value_10286.aleo {
    transition max(public arr: [u8; 10]) -> private u8 {
        let max_value: u8 = arr[0u8];

        for i:u8 in 1u8..10u8 {
            if arr[i] > max_value {
                max_value = arr[i];
            }
        }

        return max_value;
    }
}
