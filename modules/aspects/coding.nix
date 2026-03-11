{
	den.aspects.coding = {
		homeManager = { pkgs, ... }: {
			home.packages = with pkgs; [
				assimp # asset importing library
				bacon # rust code checker
				cargo-deny # cargo denpendency linting / license checking
				clang # clang compiler
				clang-tools # additional tools for clang
				gdb # c++ / rust compiler
				# glad # opengl function pointer loader (not packaged)
				godot # game engine
				qtcreator # QT IDE
				renderdoc # graphics programming debugger
				rustlings # rust beginner exercises
				scons # c++ meta build tool
				valgrind # c++ memory profiler
			];
		};
	};
}
