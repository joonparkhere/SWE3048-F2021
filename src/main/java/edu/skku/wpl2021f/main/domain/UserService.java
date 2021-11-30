package edu.skku.wpl2021f.main.domain;

import edu.skku.wpl2021f.auth.dto.CustomOAuth2UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public User loadUserByOAuth2Id(String oAuth2Id) {
        return userRepository.findByOAuth2Id(oAuth2Id).orElseThrow(RuntimeException::new);
    }

    @Transactional(readOnly = true)
    public User loadUserByNickname(String nickname) {
        return userRepository.findByNickname(nickname).orElseThrow(RuntimeException::new);
    }

    @Transactional
    public User register(CustomOAuth2UserDto oAuth2UserDto) {
        User user = oAuth2UserDto.toEntity();
        try {
            validateDuplicateUser(user);
            return userRepository.save(user);
        } catch (RuntimeException e) {
            return loadUserByOAuth2Id(oAuth2UserDto.getOAuth2Id());
        }
    }

    private void validateDuplicateUser(User user) {
        Optional<User> optionalUser = userRepository.findByOAuth2Id(user.getOAuth2Id());
        if (optionalUser.isPresent()) {
            throw new RuntimeException("Already registered user");
        }
    }

}
