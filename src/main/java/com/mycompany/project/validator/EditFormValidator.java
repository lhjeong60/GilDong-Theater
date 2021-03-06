package com.mycompany.project.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mycompany.project.dao.MemberDao;
import com.mycompany.project.model.Member;

@Component
public class EditFormValidator implements Validator {

	private static final Logger LOGGER = LoggerFactory.getLogger(EditFormValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {
		LOGGER.info("실행");
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		LOGGER.info("실행");
		Member member = (Member) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mid", "", "아이디를 입력해주세요.");

		if (member.getMpassword().length() == 0 || member.getMpassword().trim() == null) {
			errors.rejectValue("mpassword", "", "비밀번호를 입력해주세요.");
		} else if (member.getMpassword().length() < 8) {
			errors.rejectValue("mpassword", "", "비밀번호를 8자 이상 입력해주세요.");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mname", "", "이름을 입력해주세요.");
		
		if (member.getMtel().length() == 0 || member.getMtel().trim() == null) {
			errors.rejectValue("mtel", "", "전화번호를 입력해주세요. (- 제외)");
		} else if (member.getMtel().length() != 11) {
			errors.rejectValue("mtel", "", "전화번호 11자리를 입력해주세요. (- 제외)");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memail", "", "이메일을 입력해주세요.");
		
		if (member.getMbirth().length() == 0 || member.getMbirth().trim() == null) {
			errors.rejectValue("mbirth", "", "생년월일을 입력해주세요.");
		} else if (member.getMbirth().length() != 8) {
			errors.rejectValue("mbirth", "", "생년월일 8자리를 입력해주세요.");
		}
	}
}
	